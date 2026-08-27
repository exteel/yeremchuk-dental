import 'package:flutter/material.dart';
import 'package:yeremchuk_dental/theme/app_colors.dart';
import 'package:yeremchuk_dental/theme/app_spacing.dart';

class LeadFormSection extends StatefulWidget {
  const LeadFormSection({
    required this.title,
    required this.subtitle,
    required this.services,
    required this.submitLabel,
    required this.onSubmit,
    this.imagePath,
    this.trailing,
    super.key,
  });

  final String title;
  final String subtitle;
  final List<String> services;
  final String submitLabel;
  final void Function(String name, String phone, String service, DateTime? date)
      onSubmit;
  final String? imagePath;
  final Widget? trailing;

  @override
  State<LeadFormSection> createState() => _LeadFormSectionState();
}

class _LeadFormSectionState extends State<LeadFormSection> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _dateController;

  String? _selectedService;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _dateController = TextEditingController();
    if (widget.services.isNotEmpty) {
      _selectedService = widget.services.first;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = _formatDate(pickedDate);
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.'
        '${date.month.toString().padLeft(2, '0')}.'
        '${date.year}';
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(
        _nameController.text,
        _phoneController.text,
        _selectedService ?? '',
        _selectedDate,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        return Container(
          decoration: BoxDecoration(
            color: AppColors.navy,
            borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          ),
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: isWide
              ? Row(
                  children: [
                    Expanded(
                      child: _buildForm(),
                    ),
                    if (widget.imagePath != null || widget.trailing != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppSpacing.lg,
                        ),
                        child: widget.trailing ??
                            (widget.imagePath != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      AppSpacing.cardRadius,
                                    ),
                                    child: Image.asset(
                                      widget.imagePath!,
                                      fit: BoxFit.cover,
                                      width: 200,
                                      height: 250,
                                    ),
                                  )
                                : const SizedBox.shrink()),
                      ),
                  ],
                )
              : Column(
                  children: [
                    _buildForm(),
                    if (widget.imagePath != null || widget.trailing != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppSpacing.lg,
                        ),
                        child: widget.trailing ??
                            (widget.imagePath != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      AppSpacing.cardRadius,
                                    ),
                                    child: Image.asset(
                                      widget.imagePath!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 250,
                                    ),
                                  )
                                : const SizedBox.shrink()),
                      ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            widget.subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: const TextStyle(color: Colors.white70),
              filled: true,
              fillColor: AppColors.navySoft,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white24),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white24),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Phone',
              labelStyle: const TextStyle(color: Colors.white70),
              filled: true,
              fillColor: AppColors.navySoft,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white24),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white24),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
            keyboardType: TextInputType.phone,
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phone is required';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.md),
          DropdownButtonFormField<String>(
            initialValue: _selectedService,
            items: widget.services
                .map(
                  (service) => DropdownMenuItem(
                    value: service,
                    child: Text(service),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedService = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Service',
              labelStyle: const TextStyle(color: Colors.white70),
              filled: true,
              fillColor: AppColors.navySoft,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white24),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white24),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
            dropdownColor: AppColors.navy,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _dateController,
            readOnly: true,
            onTap: () => _selectDate(context),
            decoration: InputDecoration(
              labelText: 'Date',
              labelStyle: const TextStyle(color: Colors.white70),
              filled: true,
              fillColor: AppColors.navySoft,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white24),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white24),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                borderSide: const BorderSide(color: Colors.white),
              ),
              suffixIcon: const Icon(
                Icons.calendar_today,
                color: Colors.white70,
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.teal,
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.md,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
                ),
              ),
              child: Text(
                widget.submitLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
