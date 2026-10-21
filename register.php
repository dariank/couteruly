<?php
session_start();
require_once 'db.php';

$error = '';
if ($_POST) {
    $name = trim($_POST['name'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    $password2 = $_POST['password2'] ?? '';

    if (!$name || !$email || !$password) {
        $error = 'Все поля обязательны.';
    } elseif (strlen($password) < 6) {
        $error = 'Пароль должен быть не менее 6 символов.';
    } elseif ($password !== $password2) {
        $error = 'Пароли не совпадают.';
    } else {
        $stmt = $pdo->prepare("SELECT id FROM users WHERE email = ?");
        $stmt->execute([$email]);
        if ($stmt->fetch()) {
            $error = 'Email уже зарегистрирован.';
        } else {
            $hash = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $pdo->prepare("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
            $stmt->execute([$name, $email, $hash]);

            $stmt = $pdo->prepare("SELECT id, role FROM users WHERE email = ?");
            $stmt->execute([$email]);
            $user = $stmt->fetch();
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_name'] = $name;
            $_SESSION['user_role'] = $user['role'];

            header('Location: profile.php');
            exit;
        }
    }
}
?>

<?php require_once 'header.php'; ?>

<main class="container" style="max-width: 500px; margin: 60px auto; position: relative;">
    <h2 style="text-align: center; margin-bottom: 30px;">Регистрация</h2>

    <?php if ($error): ?>
        <div style="background: #f8d7da; color: #721c24; padding: 12px; border-radius: 4px; margin-bottom: 20px;">
            <?= htmlspecialchars($error) ?>
        </div>
    <?php endif; ?>

    <form method="POST" style="display: flex; flex-direction: column; gap: 16px;">
        <div>
            <label for="name">Имя</label>
            <input type="text" id="name" name="name" required 
                   style="width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 16px;">
        </div>
        <div>
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required
                   style="width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 16px;">
        </div>
        <div style="position: relative;">
            <label for="password">Пароль (мин. 6 символов)</label>
            <input type="password" id="password" name="password" required minlength="6"
                   style="width: 100%; padding: 12px 40px 12px 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 16px;">
            <button type="button" 
                    onclick="togglePasswordVisibility('password')" 
                    style="position: absolute; right: 12px; top: 42px; background: none; border: none; cursor: pointer; font-size: 18px; color: #888;"
                    aria-label="Показать пароль">
                👁️
            </button>
        </div>
        <div style="position: relative;">
            <label for="password2">Повторите пароль</label>
            <input type="password" id="password2" name="password2" required
                   style="width: 100%; padding: 12px 40px 12px 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 16px;">
            <button type="button" 
                    onclick="togglePasswordVisibility('password2')" 
                    style="position: absolute; right: 12px; top: 42px; background: none; border: none; cursor: pointer; font-size: 18px; color: #888;"
                    aria-label="Показать пароль">
                👁️
            </button>
        </div>
        <button type="submit" class="btn" style="padding: 12px; font-size: 16px;">Зарегистрироваться</button>
    </form>

    <div style="text-align: center; margin-top: 20px;">
        <p>Уже есть аккаунт? <a href="login.php" style="color: #000; text-decoration: underline;">Войти</a></p>
    </div>
</main>

<script>
function togglePasswordVisibility(inputId) {
    const input = document.getElementById(inputId);
    if (input.type === 'password') {
        input.type = 'text';
    } else {
        input.type = 'password';
    }
}
</script>

<?php require_once 'footer.php'; ?>