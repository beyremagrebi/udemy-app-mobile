import 'dart:async';

import 'package:erudaxis/presentation/utils/session/app_initialize.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/material.dart';

class SplashScreenViewModel extends BaseViewModel {
  // Animation Controllers
  AnimationController? _logoController;
  AnimationController? _textController;
  AnimationController? _loadingController;
  AnimationController? _backgroundController;

  // Animations
  Animation<double>? _logoScale;
  Animation<double>? _logoOpacity;
  Animation<double>? _textOpacity;
  Animation<Offset>? _textSlide;
  Animation<double>? _loadingOpacity;
  Animation<double>? _backgroundOpacity;

  // State
  bool _isInitialized = false;
  bool _shouldNavigate = false;

  SplashScreenViewModel(super.context);

  Animation<double>? get backgroundOpacity => _backgroundOpacity;
  bool get isInitialized => _isInitialized;
  Animation<double>? get loadingOpacity => _loadingOpacity;
  Animation<double>? get logoOpacity => _logoOpacity;
  // Getters
  Animation<double>? get logoScale => _logoScale;
  bool get shouldNavigate => _shouldNavigate;

  Animation<double>? get textOpacity => _textOpacity;
  Animation<Offset>? get textSlide => _textSlide;

  @override
  void dispose() {
    _logoController?.dispose();
    _textController?.dispose();
    _loadingController?.dispose();
    _backgroundController?.dispose();
    super.dispose();
  }

  void initialize(TickerProvider vsync) {
    if (_isInitialized) {
      return;
    }

    _initializeAnimations(vsync);
    _startAnimationSequence();
    _isInitialized = true;
  }

  void onAnimationComplete(BuildContext context) {
    if (_shouldNavigate) {
      AppStarter.start(context);
    }
  }

  void _initializeAnimations(TickerProvider vsync) {
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: vsync,
    );

    _logoScale = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _logoController!,
      curve: Curves.elasticOut,
    ));

    _logoOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _logoController!,
      curve: const Interval(0, 0.6, curve: Curves.easeIn),
    ));

    // Animation du texte
    _textController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );

    _textOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _textController!,
      curve: Curves.easeIn,
    ));

    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _textController!,
      curve: Curves.easeOutCubic,
    ));

    // Animation du loading
    _loadingController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: vsync,
    );

    _loadingOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _loadingController!,
      curve: Curves.easeIn,
    ));

    // Animation du background
    _backgroundController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: vsync,
    );

    _backgroundOpacity = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _backgroundController!,
      curve: Curves.easeInOut,
    ));

    // Add listeners to notify when animations change
    _logoController!.addListener(update);
    _textController!.addListener(update);
    _loadingController!.addListener(update);
    _backgroundController!.addListener(update);
  }

  Future<void> _startAnimationSequence() async {
    _backgroundController?.forward();
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _logoController?.forward();

    await Future<void>.delayed(const Duration(milliseconds: 600));
    _textController?.forward();

    await Future<void>.delayed(const Duration(milliseconds: 400));
    _loadingController?.forward();

    await Future<void>.delayed(const Duration(milliseconds: 2500));
    _shouldNavigate = true;
    update();
  }
}
