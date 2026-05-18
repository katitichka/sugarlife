/// Пользовательские сообщения об ошибках (без технических деталей).
abstract final class ErrorMessages {
  static const network =
      'Нет подключения к интернету. Проверьте сеть и попробуйте снова.';
  static const timeout =
      'Превышено время ожидания. Проверьте соединение и попробуйте снова.';
  static const server =
      'Сервер временно недоступен. Попробуйте позже.';
  static const unknown = 'Что-то пошло не так. Попробуйте ещё раз.';
  static const loadFailed = 'Не удалось загрузить данные.';
  static const saveFailed = 'Не удалось сохранить данные.';
  static const authFailed = 'Не удалось войти. Проверьте email и пароль.';
  static const signUpFailed = 'Не удалось зарегистрироваться. Попробуйте позже.';
  static const authCheckFailed =
      'Не удалось проверить авторизацию. Попробуйте снова.';
  static const logoutFailed = 'Не удалось выйти из аккаунта.';
  static const invalidCredentials = 'Неверный email или пароль.';
  static const emailAlreadyRegistered =
      'Аккаунт с таким email уже зарегистрирован.';
  static const emailNotConfirmed =
      'Подтвердите email по ссылке из письма и войдите снова.';
  static const weakPassword =
      'Пароль слишком простой. Используйте не менее 6 символов.';
  static const accessDenied = 'Недостаточно прав для выполнения действия.';
  static const notFound = 'Запрашиваемые данные не найдены.';
  static const retryButton = 'Повторить';
}
