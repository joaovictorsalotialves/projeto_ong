export const textEmail = (name, authCode) => `
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recuperação de Senha</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    .container {
      max-width: 600px;
      margin: 50px auto;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .header {
      text-align: center;
      padding-bottom: 20px;
    }
    .header h1 {
      color: #333333;
    }
    .content {
      font-size: 16px;
      color: #555555;
      line-height: 1.6;
    }
    .code {
      text-align: center;
      font-size: 24px;
      font-weight: bold;
      color: #333333;
      margin: 20px 0;
    }
    .footer {
      text-align: center;
      font-size: 14px;
      color: #888888;
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <h1>Recuperação de Senha</h1>
    </div>
    <div class="content">
      <p>Olá, <strong>${name}</strong>,</p>
      <p>Recebemos uma solicitação para redefinir sua senha. Para continuar com o processo de recuperação de conta, insira o código de verificação abaixo no campo solicitado:</p>
      <div class="code">${authCode}</div>
      <p>Esse código é válido por <strong>10 minutos</strong>. Se você não fez essa solicitação, pode ignorar este e-mail e sua senha permanecerá a mesma.</p>
      <p>Se precisar de ajuda, entre em contato com nosso suporte.</p>
    </div>
    <div class="footer">
      <p>Atenciosamente,<br>Equipe de Suporte</p>
    </div>
  </div>
</body>
</html>
`;
