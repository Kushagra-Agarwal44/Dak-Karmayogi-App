// lib/features/profile/presentation/pages/profile_page.dart

import 'package:dak_karmayogi_app/core/constants/app_assets.dart';
import 'package:dak_karmayogi_app/features/profile/domain/entities/profile.dart';
import 'package:dak_karmayogi_app/features/profile/presentation/providers/profile_controller.dart';
import 'package:dak_karmayogi_app/features/profile/presentation/widgets/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dak_karmayogi_app/core/theme/app_colors.dart';
import 'package:marquee/marquee.dart';


class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileControllerProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
      ),
      body: profileState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : profileState.error != null
              ? Center(child: Text(profileState.error!))
              : profileState.profile == null
                  ? const Center(child: Text("No Profile Data"))
                  : _buildProfileContent(profileState),
    );
  }

Widget _buildProfileHeader(ProfileEntity user) {
  final fullName = "${user.firstname ?? ''} ${user.lastname ?? ''}".trim();
  final hasImage =
      user.location != null && !user.location!.contains('NO-IMAGE');

  return Container(
    margin: const EdgeInsets.only(top: 16, bottom: 16),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 38,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              backgroundImage:
                  hasImage ? NetworkImage(user.location!) : null,
              child: hasImage
                  ? null
                  : ClipOval(
                      child: Image.asset(
                        AppAssets.donaldimage,
                        width: 76,
                        height: 76,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),

            /// Edit button
            Positioned(
              bottom: -2,
              right: -2,
              child: InkWell(
                onTap: () {
                  // TODO: pick image
                },
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),

        const SizedBox(width: 20),

        /// User info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                
                height: 22,
                child: Marquee(
                   text: fullName.isEmpty ? "Unknown User" : fullName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      scrollAxis: Axis.horizontal,
                      blankSpace: 40,
                      velocity: 30,
                      pauseAfterRound: const Duration(seconds: 1),
                ),
              ),
                
              const SizedBox(height: 12),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "ID: ${user.username ?? 'N/A'}",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    ),
  );
}
 
 



  Widget _buildProfileContent(profileState) {
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
                    // _buildTextField("Employee ID", user.username, readOnly: true, isWide: isWide),
                    // _buildTextField("Employee Name", "${user.firstname ?? ''} ${user.lastname ?? ''}".trim(), readOnly: true, isWide: isWide),
                    _buildDropdown("Designation", user.cadreStatus, ["PA", "SA", "GDS"], isWide: isWide),
                    _buildDropdown("Gender", user.gender, ["Male", "Female", "Other"], isWide: isWide),
                    _buildTextField("Date of Birth", user.dob, readOnly: true, isWide: isWide),
                    _buildDropdown("Category", user.caste, ["GENERAL", "OBC", "SC", "ST"], isWide: isWide),
                    _buildDropdown("Circle", user.circle, ["Gujarat", "Maharashtra"], isWide: isWide),
                    _buildDropdown("Region", user.region, ["Rajkot Region", "Ahmedabad Region"], isWide: isWide),
                    _buildDropdown("Division", user.division, ["Rajkot Division", "Morbi Division"], isWide: isWide),
                    _buildTextField("Aadhar No.", user.aadhaarNumber, isWide: isWide),
                    _buildTextField("Date of joining (Dept)", user.dateOfJoining, suffixIcon: Icons.calendar_today_outlined, isWide: isWide),
                    _buildTextField("Date of joining (Cadre)", user.dateOfJoiningCc, suffixIcon: Icons.calendar_today_outlined, isWide: isWide),
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
                    _buildDropdown("Educational Qualification", user.qualification, ["Below Higher Secondary (10 - SSC)", "Graduation (B.Tech)", "Post Graduation"], isWide: isWide),
                    _buildTextField("Hobby", user.hobby, isWide: isWide),
                    _buildDropdown("Knowledge of Computer", user.knowComputer, ["YES", "NO"], isWide: isWide),
                    _buildTextField("Residential Address", user.address, isWide: isWide),
                    _buildTextField("Mobile No.", user.contactNo?.toString(), suffixIcon: Icons.edit_outlined, isWide: isWide),
                    _buildTextField("Email ID", user.email, readOnly: true, isWide: isWide),
                    _buildDropdown("Blood Group", user.bloodGroup, ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"], isWide: isWide),
                    _buildTextField("Identification Mark", user.identification, isWide: isWide),
                    _buildTextField("Previous Illness History", user.medicalHistory, isWide: isWide),
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
                    _buildTextField("Name", user.emergencyCName, isWide: isWide),
                    _buildDropdown("Relation", user.emergencyCRelation, ["Parent", "Spouse", "Sibling", "Friend"], isWide: isWide),
                    _buildTextField("Contact No.", user.emergencyCNo, isWide: isWide),
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
                      // Edit API not implemented yet
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.grey.shade50,
                        border: Border.all(
                          color: isSelected ? AppColors.primary : Colors.grey.shade300,
                          width: 1,
                        ),
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
              onPressed: () {},
              icon: const Icon(Icons.save_outlined, size: 20),
              label: const Text("Save Changes", style: TextStyle(fontWeight: FontWeight.w600)),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String? initialValue, {bool readOnly = false, IconData? suffixIcon, required bool isWide}) {
    return SizedBox(
      width: isWide ? 300 : double.infinity,
      child: TextFormField(
        initialValue: initialValue ?? '',
        readOnly: readOnly,
        style: TextStyle(
          color: readOnly ? Colors.grey.shade600 : AppColors.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),
          floatingLabelStyle: const TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w600),
          filled: true,
          fillColor: readOnly ? Colors.grey.shade100 : Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 18, color: AppColors.primary) : null,
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> options, {required bool isWide}) {
    String? dropdownValue = options.contains(value) ? value : null;
    return SizedBox(
      width: isWide ? 300 : double.infinity,
      child: DropdownButtonFormField<String>(
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.primary),
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        items: options.map((opt) => DropdownMenuItem(value: opt, child: Text(opt))).toList(),
        onChanged: (val) {},
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),
          floatingLabelStyle: const TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w600),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
        ),
      ),
    );
  }
}