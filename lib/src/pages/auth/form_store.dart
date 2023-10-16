import 'package:mobx/mobx.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  @observable
  String username = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setName(String value) => username = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;
}
