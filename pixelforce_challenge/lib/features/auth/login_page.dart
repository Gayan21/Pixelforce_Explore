import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool loading = false;

  Future<void> _login() async {
    try {
      setState(() => loading = true);
      await Future.delayed(const Duration(seconds: 1));

      if (username.text.isEmpty || password.text.isEmpty) {
        throw Exception("Please enter username and password");
      }

      if (!mounted) return;
      setState(() => loading = false);
      Navigator.pushReplacementNamed(context, '/explore');
    } catch (e) {
      if (mounted) {
        setState(() => loading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 44),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  color: AppColors.blueDark,
                ),
                const SizedBox(height: 32),
                Text(
                  "Welcome Back",
                  style: AppText.title18.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  "Log in to your Placoo account to explore your dream place to live across the whole world!",
                  style: AppText.cardSub13.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 36),
                _inputLabel("Username"),
                const SizedBox(height: 8),
                _inputField(controller: username, hint: "Enter username", icon: Icons.person),
                const SizedBox(height: 20),
                _inputLabel("Password"),
                const SizedBox(height: 8),
                _inputField(controller: password, hint: "Enter password", icon: Icons.key, obscure: true),
                const SizedBox(height: 20),

                
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: loading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [AppColors.gradientStart, AppColors.gradientEnd],
                          stops: [0.0261, 0.9658],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: loading
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : const Text(
                                "Log in",
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      "Forgot password?",
                      style: AppText.navLabel,
                    ),
                  ),
                ),

                const SizedBox(height: 24),
                Row(
                  children: [
                    const Expanded(child: Divider(color: Color(0xFFEBE8F7))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "OR",
                        style: AppText.navLabel.copyWith(
                          color: const Color(0xFF9E91DA),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(color: Color(0xFFEBE8F7))),
                  ],
                ),
                const SizedBox(height: 24),

                
                _socialButton(
                  color: const Color(0xFF222831),
                  label: "Sign in with Apple",
                  icon: FontAwesomeIcons.apple,
                  labelColor: Colors.white,
                  onTap: () {},
                ),
                const SizedBox(height: 12),

                
                _socialButton(
                  color: Colors.white,
                  label: "Sign in with Google",
                  icon: FontAwesomeIcons.google,
                  labelColor: const Color(0xFF475569),
                  borderColor: const Color(0xFFE2E8F0),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputLabel(String label) {
    return Text(label, style: AppText.cardTitle16);
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    IconData? icon,
    bool obscure = false,
  }) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.searchBg,
        borderRadius: BorderRadius.circular(81),
        border: Border.all(color: AppColors.searchBorder, width: 0.8),
      ),
      child: Row(
        children: [
          if (icon != null) Icon(icon, color: AppColors.gradientStart),
          if (icon != null) const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscure,
              decoration: InputDecoration(border: InputBorder.none, hintText: hint),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialButton({
    required Color color,
    required String label,
    required IconData icon,
    required Color labelColor,
    VoidCallback? onTap,
    Color? borderColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: borderColor != null ? Border.all(color: borderColor) : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            
            Align(
              alignment: Alignment.centerLeft,
              child: FaIcon(icon, color: labelColor, size: 22),
            ),
            
            Center(
              child: Text(
                label,
                style: TextStyle(
                  color: labelColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
