import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sugarlife/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  await Supabase.initialize(
    url: 'https://txiaenkqdtgiqhzhepwq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR4aWFlbmtxZHRnaXFoemhlcHdxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg5NzQ1ODYsImV4cCI6MjA4NDU1MDU4Nn0.KHPrtctWAYOIpprMK1vvgSc1jgpbooJEApAOe0XRZ78',
  );
  final supabase = Supabase.instance.client;
  app(prefs, supabase);
}
