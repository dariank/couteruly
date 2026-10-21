<?php require_once 'header.php'; ?>

<!-- Боковое меню (основное) -->
<div class="sidebar-menu">
    <div class="sidebar-header">
        <span>📍 Нижний Новгород</span>
        <a href="index.php" style="float: right; font-size: 24px; color: #000; text-decoration: none;">×</a>
    </div>

    <div class="sidebar-categories">
        <div style="display: flex; gap: 20px; margin: 20px 0;">
            <a href="#" class="gender active">ЖЕНЩИНАМ</a>

        </div>

        <div class="category-list">
            <a href="catalog.php?category=<?= urlencode('Новая коллекция') ?>">НОВАЯ КОЛЛЕКЦИЯ</a>
            <a href="catalog.php">ВСЯ КОЛЛЕКЦИЯ</a> 
            <a href="clothing.php" class="active">ОДЕЖДА</a>
            <a href="catalog.php?category=<?= urlencode('Аксессуары') ?>">АКСЕССУАРЫ</a>
           <a href="sale.php" style="color: #ff4d4d;">РАСПРОДАЖА</a>
        </div>

    
    </div>
</div>

<!-- Подменю для ОДЕЖДА (справа) -->
<div class="subcategory-panel">
    <h4 style="margin-bottom: 10px; font-weight: 600; padding: 10px 20px; background: #f5f5f5;">СМОТРЕТЬ ВСЁ</h4>
    <div style="padding: 10px 20px; border-left: 2px solid #ddd;">
        <a href="catalog.php?category=<?= urlencode('Платья и комбинезоны') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Платья и комбинезоны</a>
        <a href="catalog.php?category=<?= urlencode('Блузки и рубашки') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Блузки и рубашки</a>
        <a href="catalog.php?category=<?= urlencode('Футболки и топы') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Футболки и топы</a>
        <a href="catalog.php?category=<?= urlencode('Брюки') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Брюки</a>
        <a href="catalog.php?category=<?= urlencode('Джинсы') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Джинсы</a>
        <a href="catalog.php?category=<?= urlencode('Шорты') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Шорты</a>
        <a href="catalog.php?category=<?= urlencode('Юбки') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Юбки</a>
        <a href="catalog.php?category=<?= urlencode('Костюмы') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Костюмы</a>
        <a href="catalog.php?category=<?= urlencode('Пиджаки и жакеты') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Пиджаки и жакеты</a>
        <a href="catalog.php?category=<?= urlencode('Верхняя одежда') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Верхняя одежда</a>
        <a href="catalog.php?category=<?= urlencode('Джемперы и кардиганы') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Джемперы и кардиганы</a>
        <a href="catalog.php?category=<?= urlencode('Толстовки и худи') ?>" style="display: block; padding: 8px 0; text-decoration: none; color: #000; transition: color 0.2s;">Толстовки и худи</a>
    </div>
</div>

<!-- Затемнение фона -->
<div class="overlay"></div>

<style>
.sidebar-menu {
    position: fixed;
    left: 0;
    top: 0;
    width: 300px;
    height: 100vh;
    background: #fff;
    z-index: 1000;
    box-shadow: 2px 0 10px rgba(0,0,0,0.1);
    padding: 20px;
    overflow-y: auto;
}

.subcategory-panel {
    position: fixed;
    left: 300px;
    top: 0;
    width: 300px;
    height: 100vh;
    background: #fff;
    z-index: 999;
    box-shadow: 2px 0 10px rgba(0,0,0,0.1);
    padding: 20px;
    overflow-y: auto;
    border-left: 1px solid #eee;
}

.sidebar-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 20px;
    border-bottom: 1px solid #eee;
    margin-bottom: 20px;
}

.gender {
    text-decoration: none;
    color: #000;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
}
.gender.active {
    border-bottom: 2px solid #000;
}

.category-list a,
.additional-links a,
.subcategory-panel a {
    display: block;
    padding: 8px 0;
    text-decoration: none;
    color: #000;
    font-weight: 600;
    transition: color 0.2s;
}
.category-list a:hover,
.additional-links a:hover,
.subcategory-panel a:hover {
    color: #666;
}

.subcategory-panel h4 {
    margin: 0 0 10px;
    font-weight: 600;
    color: #333;
}

.overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.5);
    z-index: 998;
}

/* Адаптив */
@media (max-width: 768px) {
    .sidebar-menu {
        width: 80%;
    }
    .subcategory-panel {
        left: 80%;
        width: 20%;
    }
}
</style>

<?php require_once 'footer.php'; ?>