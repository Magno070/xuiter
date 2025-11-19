import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Classe centralizada para gerenciar todas as rotas do aplicativo
/// Fornece constantes para paths e métodos de navegação tipados
class AppRoutes {
  // Previne instanciação
  AppRoutes._();

  // ========== PATHS ==========
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String app = '/app';
  static const String feed = '/app/feed';
  static const String search = '/app/search';
  static const String notifications = '/app/notifications';
  static const String messages = '/app/messages';
  static const String profile = '/app/profile';

  // ========== NAVIGATION METHODS ==========

  /// Navega para a tela de splash
  static void goToSplash(BuildContext context) {
    context.go(splash);
  }

  /// Navega para a tela de login
  static void goToLogin(BuildContext context) {
    context.go(login);
  }

  /// Navega para a tela de registro
  static void goToRegister(BuildContext context) {
    context.go(register);
  }

  /// Navega para a tela principal do app
  static void goToApp(BuildContext context) {
    context.go(app);
  }

  /// Navega para a tela de feed
  static void goToFeed(BuildContext context) {
    context.go(feed);
  }

  /// Navega para a tela de busca
  static void goToSearch(BuildContext context) {
    context.go(search);
  }

  /// Navega para a tela de notificações
  static void goToNotifications(BuildContext context) {
    context.go(notifications);
  }

  /// Navega para a tela de mensagens
  static void goToMessages(BuildContext context) {
    context.go(messages);
  }

  /// Navega para a tela de perfil
  static void goToProfile(BuildContext context) {
    context.go(profile);
  }

  /// Empilha a tela de registro (pode voltar)
  static void pushRegister(BuildContext context) {
    context.push(register);
  }

  /// Volta para a tela anterior
  static void goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    }
  }
}
