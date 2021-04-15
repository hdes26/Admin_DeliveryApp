class Usuario {
  int numero;
  Usuario({
    this.numero,
  });
}

class LoginModal extends Usuario {
  int code;

  LoginModal({
    this.code,
  });
}
