// lib/features/profile/presentation/pages/profile_page.dart

import 'package:dak_karmayogi_app/features/profile/domain/entities/profile.dart';
import 'package:dak_karmayogi_app/features/profile/presentation/providers/profile_controller.dart';
import 'package:dak_karmayogi_app/features/profile/presentation/providers/profile_state.dart';
import 'package:dak_karmayogi_app/features/profile/presentation/widgets/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dak_karmayogi_app/core/theme/app_colors.dart';
import 'package:dak_karmayogi_app/core/constants/app_assets.dart';
import 'package:marquee/marquee.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  bool _isFormInitialized = false;

  // Controllers for text fields
  final _aadhaarController = TextEditingController();
  final _dojController = TextEditingController();
  final _dojCcController = TextEditingController();
  final _hobbyController = TextEditingController();
  final _addressController = TextEditingController();
  final _identificationController = TextEditingController();
  final _medicalHistoryController = TextEditingController();
  final _emergencyNameController = TextEditingController();
  final _emergencyPhoneController = TextEditingController();

  // Dropdown states
  String? _gender;
  String? _category;
  String? _circle;
  String? _region;
  String? _division;
  String? _qualification;
  String? _designation;
  String? _knowComputer;
  String? _bloodGroup;
  String? _emergencyRelation;

  // Master Lists from APIs
  List<String> _circlesList = [];
  List<String> _regionsList = [];
  List<String> _divisionsList = [];
  List<String> _bloodGroupsList = [];
  List<String> _qualificationsList = [];
  List<String> _categoriesList = [];
  List<String> _relationsList = [];

  // Loading States for Cascading Drops
  bool _isLoadingRegions = false;
  bool _isLoadingDivisions = false;

  @override
  void dispose() {
    _aadhaarController.dispose();
    _dojController.dispose();
    _dojCcController.dispose();
    _hobbyController.dispose();
    _addressController.dispose();
    _identificationController.dispose();
    _medicalHistoryController.dispose();
    _emergencyNameController.dispose();
    _emergencyPhoneController.dispose();
    super.dispose();
  }

  Future<void> _fetchStaticLists() async {
    final repo = ref.read(profileRepositoryGetter);
    final results = await Future.wait([
      repo.getCircleList(),
      repo.getBloodGroupList(),
      repo.getQualificationList(),
      repo.getCategoryList(),
      repo.getRelationList(),
    ]);

    if (mounted) {
      setState(() {
        _circlesList = results[0];
        _bloodGroupsList = results[1];
        _qualificationsList = results[2];
        _categoriesList = results[3];
        _relationsList = results[4];
      });
    }
  }

  void _initializeForm(ProfileEntity user) async {
    if (_isFormInitialized) return;

    // Fetch master dropdown data
    await _fetchStaticLists();

    setState(() {
      _aadhaarController.text = user.aadhaarNumber ?? '';
      _dojController.text = user.dateOfJoining ?? '';
      _dojCcController.text = user.dateOfJoiningCc ?? '';
      _hobbyController.text = user.hobby ?? '';
      _addressController.text = user.address ?? '';
      _identificationController.text = user.identification ?? '';
      _medicalHistoryController.text = user.medicalHistory ?? '';
      _emergencyNameController.text = user.emergencyCName ?? '';
      _emergencyPhoneController.text = user.emergencyCNo ?? '';

      // Initialize simple dropdowns (ensure value exists in hardcoded lists or wait for API)
      _gender = ["Male", "Female"].contains(user.gender) ? user.gender : null;
      _designation = ["PA", "SA", "GDS"].contains(user.cadreStatus) ? user.cadreStatus : null;
      _knowComputer = ["YES", "NO"].contains(user.knowComputer) ? user.knowComputer : null;

      _category = user.caste;
      _bloodGroup = user.bloodGroup;
      _qualification = user.qualification;
      _emergencyRelation = user.emergencyCRelation;
      
      _circle = user.circle;
      _isFormInitialized = true;
    });

    // If user already has a circle, we need to fetch regions to populate the next dropdown
    if (_circle != null && _circle!.isNotEmpty) {
      await _fetchRegions(_circle!);
      setState(() => _region = user.region);
      
      // If user already has a region, fetch divisions
      if (_region != null && _region!.isNotEmpty) {
        await _fetchDivisions(_circle!, _region!);
        setState(() => _division = user.division);
      }
    }
  }

  Future<void> _fetchRegions(String circle) async {
    setState(() => _isLoadingRegions = true);
    final regions = await ref.read(profileRepositoryGetter).getRegionList(circle);
    if (mounted) {
      setState(() {
        _regionsList = regions;
        _isLoadingRegions = false;
      });
    }
  }

  Future<void> _fetchDivisions(String circle, String region) async {
    setState(() => _isLoadingDivisions = true);
    final divisions = await ref.read(profileRepositoryGetter).getDivisionList(circle, region);
    if (mounted) {
      setState(() {
        _divisionsList = divisions;
        _isLoadingDivisions = false;
      });
    }
  }

  void _onCircleChanged(String? newValue) {
    if (newValue == null || newValue == _circle) return;
    setState(() {
      _circle = newValue;
      // Reset downstream
      _region = null;
      _division = null;
      _regionsList = [];
      _divisionsList = [];
    });
    _fetchRegions(newValue);
  }

  void _onRegionChanged(String? newValue) {
    if (newValue == null || newValue == _region || _circle == null) return;
    setState(() {
      _region = newValue;
      // Reset downstream
      _division = null;
      _divisionsList = [];
    });
    _fetchDivisions(_circle!, newValue);
  }

  void _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;
    
    final payload = {
      "GENDER": _gender ?? "",
      "CASTE": _category ?? "",
      "circle": _circle ?? "",
      "region": _region ?? "",
      "division": _division ?? "",
      "aadhaar_number": _aadhaarController.text,
      "date_of_joining": _dojController.text,
      "date_of_joining_cc": _dojCcController.text,
      "QUALIFICATION": _qualification ?? "",
      "cadre_status": _designation ?? "",
      "hobby": _hobbyController.text,
      "know_computer": _knowComputer ?? "",    
      "address": _addressController.text,    
      "blood_group": _bloodGroup ?? "",
      "identification": _identificationController.text,
      "medical_history": _medicalHistoryController.text,    
      "emergency_c_name": _emergencyNameController.text,
      "emergency_c_relation": _emergencyRelation ?? "",
      "emergency_c_no": _emergencyPhoneController.text
    };

    final success = await ref.read(profileControllerProvider.notifier).updateProfile(payload);
    
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile Updated Successfully!"), backgroundColor: Colors.green),
      );
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ref.read(profileControllerProvider).updateError ?? "Update Failed"), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileControllerProvider);

    // Initialize form once data is loaded
    if (profileState.profile != null && !_isFormInitialized) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _initializeForm(profileState.profile!);
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
      ),
      body: profileState.isLoading && !_isFormInitialized
          ? const Center(child: CircularProgressIndicator())
          : profileState.error != null
              ? Center(child: Text(profileState.error!))
              : profileState.profile == null
                  ? const Center(child: Text("No Profile Data"))
                  : Form(
                      key: _formKey,
                      child: _buildProfileContent(profileState),
                    ),
    );
  }

  Widget _buildProfileHeader(ProfileEntity user) {
    final fullName = "${user.firstname ?? ''} ${user.lastname ?? ''}".trim();
    final hasImage = user.location != null && !user.location!.contains('NO-IMAGE');

    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: CircleAvatar(
                  radius: 38,
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  backgroundImage: hasImage ? NetworkImage(user.location!) : null,
                  child: hasImage
                      ? null
                      : ClipOval(
                          child: Image.asset(
                            AppAssets.donaldimage, // Verify you have this asset
                            width: 76,
                            height: 76,
                            fit: BoxFit.cover,
                            errorBuilder: (ctx, _, __) => const Icon(Icons.person, size: 40, color: AppColors.primary),
                          ),
                        ),
                ),
              ),
              Positioned(
                bottom: -2,
                right: -2,
                child: InkWell(
                  onTap: () {
                    // TODO: Implement actual image picker logic
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.edit, size: 14, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 22,
                  child: Marquee(
                    text: fullName.isEmpty ? "Unknown User" : fullName,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    scrollAxis: Axis.horizontal,
                    blankSpace: 40,
                    velocity: 30,
                    pauseAfterRound: const Duration(seconds: 1),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "ID: ${user.username ?? 'N/A'}",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(ProfileState profileState) {
    final user = profileState.profile!;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _buildProfileHeader(user),
          
          ProfileSectionCard(
            title: "Basic Details",
            icon: Icons.person_outline,
            initiallyExpanded: true,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 600;
                return Wrap(
                  spacing: 16,
                  runSpacing: 20,
                  children: [
                    _buildTextField("Employee ID", initialValue: user.username, readOnly: true, isWide: isWide),
                    _buildDropdown("Designation", _designation, ["PA", "SA", "GDS"], (val) => setState(() => _designation = val), isWide: isWide),
                    _buildDropdown("Gender", _gender, ["Male", "Female"], (val) => setState(() => _gender = val), isWide: isWide),
                    _buildTextField("Date of Birth", initialValue: user.dob, readOnly: true, isWide: isWide),
                    _buildDropdown("Category", _category, _categoriesList, (val) => setState(() => _category = val), isWide: isWide),
                    
                    // CASCADING DROPDOWNS
                    _buildDropdown("Circle", _circle, _circlesList, _onCircleChanged, isWide: isWide),
                    _buildDropdown("Region", _region, _regionsList, _onRegionChanged, isWide: isWide, isLoading: _isLoadingRegions, isEnabled: _circle != null),
                    _buildDropdown("Division", _division, _divisionsList, (val) => setState(() => _division = val), isWide: isWide, isLoading: _isLoadingDivisions, isEnabled: _region != null),
                    
                    _buildTextField("Aadhar No.", controller: _aadhaarController, isWide: isWide),
                    _buildTextField("Date of joining (Dept)", controller: _dojController, suffixIcon: Icons.calendar_today_outlined, isWide: isWide),
                    _buildTextField("Date of joining (Cadre)", controller: _dojCcController, suffixIcon: Icons.calendar_today_outlined, isWide: isWide),
                  ],
                );
              },
            ),
          ),
          ProfileSectionCard(
            title: "Other Details",
            icon: Icons.list_alt,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 600;
                return Wrap(
                  spacing: 16,
                  runSpacing: 20,
                  children: [
                    _buildDropdown("Educational Qualification", _qualification, _qualificationsList, (val) => setState(() => _qualification = val), isWide: isWide),
                    _buildTextField("Hobby", controller: _hobbyController, isWide: isWide),
                    _buildDropdown("Knowledge of Computer", _knowComputer, ["YES", "NO"], (val) => setState(() => _knowComputer = val), isWide: isWide),
                    _buildTextField("Residential Address", controller: _addressController, isWide: isWide),
                    _buildTextField("Mobile No.", initialValue: user.contactNo?.toString(), readOnly: true, suffixIcon: Icons.lock_outline, isWide: isWide),
                    _buildTextField("Email ID", initialValue: user.email, readOnly: true, isWide: isWide),
                    _buildDropdown("Blood Group", _bloodGroup, _bloodGroupsList, (val) => setState(() => _bloodGroup = val), isWide: isWide),
                    _buildTextField("Identification Mark", controller: _identificationController, isWide: isWide),
                    _buildTextField("Previous Illness History", controller: _medicalHistoryController, isWide: isWide),
                  ],
                );
              },
            ),
          ),
          ProfileSectionCard(
            title: "Emergency Contact Details",
            icon: Icons.contact_emergency_outlined,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 600;
                return Wrap(
                  spacing: 16,
                  runSpacing: 20,
                  children: [
                    _buildTextField("Name", controller: _emergencyNameController, isWide: isWide),
                    _buildDropdown("Relation", _emergencyRelation, _relationsList, (val) => setState(() => _emergencyRelation = val), isWide: isWide),
                    _buildTextField("Contact No.", controller: _emergencyPhoneController, isWide: isWide),
                  ],
                );
              },
            ),
          ),
          if (profileState.interests != null)
            ProfileSectionCard(
              title: "Field of Interest",
              icon: Icons.favorite_border,
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: profileState.interests!.map<Widget>((interest) {
                  final isSelected = interest.interested == "YES";
                  return InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      // Handled by separate API technically
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.grey.shade50,
                        border: Border.all(color: isSelected ? AppColors.primary : Colors.grey.shade300, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isSelected ? Icons.check_circle : Icons.circle_outlined,
                            color: isSelected ? AppColors.primary : Colors.grey.shade400,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            interest.interestedField,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                              color: isSelected ? AppColors.primary : AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          const SizedBox(height: 8),
          
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              onPressed: profileState.isUpdating ? null : _saveProfile,
              icon: profileState.isUpdating 
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Icon(Icons.save_outlined, size: 20),
              label: Text(profileState.isUpdating ? "Saving..." : "Save Changes", style: const TextStyle(fontWeight: FontWeight.w600)),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {TextEditingController? controller, String? initialValue, bool readOnly = false, IconData? suffixIcon, required bool isWide}) {
    return SizedBox(
      width: isWide ? 300 : double.infinity,
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        readOnly: readOnly,
        style: TextStyle(color: readOnly ? Colors.grey.shade600 : AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),
          floatingLabelStyle: const TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w600),
          filled: true,
          fillColor: readOnly ? Colors.grey.shade100 : Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
          suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 18, color: readOnly ? Colors.grey.shade400 : AppColors.primary) : null,
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> options, Function(String?) onChanged, {required bool isWide, bool isLoading = false, bool isEnabled = true}) {
    // Safety check: ensure current value exists in loaded options, otherwise set null
    String? dropdownValue = options.contains(value) ? value : null;
    
    return SizedBox(
      width: isWide ? 300 : double.infinity,
      child: DropdownButtonFormField<String>(
        value: dropdownValue,
        icon: isLoading 
            ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) 
            : const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.primary),
        style: const TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
        items: options.map<DropdownMenuItem<String>>((opt) => DropdownMenuItem(value: opt, child: Text(opt))).toList(),
        onChanged: isEnabled && !isLoading ? onChanged : null,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),
          floatingLabelStyle: const TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w600),
          filled: true,
          fillColor: isEnabled ? Colors.white : Colors.grey.shade100,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade300)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade200)),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
        ),
      ),
    );
  }
}