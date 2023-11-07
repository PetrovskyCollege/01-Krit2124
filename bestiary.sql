-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 07 2023 г., 12:01
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bestiary`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ability`
--

CREATE TABLE `ability` (
  `id` int NOT NULL,
  `description` text NOT NULL COMMENT 'Описание особенности',
  `id_npc` int NOT NULL COMMENT 'Существо, к которому оно привязано'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица особенностей существа';

-- --------------------------------------------------------

--
-- Структура таблицы `access_type`
--

CREATE TABLE `access_type` (
  `id` int NOT NULL,
  `type` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Тип доступа пользователя (в коде используется id, это поле для пояснения)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы доступа пользователей';

--
-- Дамп данных таблицы `access_type`
--

INSERT INTO `access_type` (`id`, `type`) VALUES
(1, 'Администратор'),
(2, 'Пользователь');

-- --------------------------------------------------------

--
-- Структура таблицы `action`
--

CREATE TABLE `action` (
  `id` int NOT NULL,
  `description` text NOT NULL COMMENT 'Описание действия',
  `id_npc` int NOT NULL COMMENT 'Существо, к которому привязано действие'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица действий существа';

-- --------------------------------------------------------

--
-- Структура таблицы `characteristic_for_saving_throw`
--

CREATE TABLE `characteristic_for_saving_throw` (
  `id` int NOT NULL,
  `characteristic` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Характеристики для спасбросков';

-- --------------------------------------------------------

--
-- Структура таблицы `damage_type`
--

CREATE TABLE `damage_type` (
  `id` int NOT NULL,
  `type` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы урона';

-- --------------------------------------------------------

--
-- Структура таблицы `description`
--

CREATE TABLE `description` (
  `id` int NOT NULL,
  `description` text NOT NULL COMMENT 'Описание существа',
  `id_npc` int NOT NULL COMMENT 'Существо, к которому привязано описание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Описание существа';

-- --------------------------------------------------------

--
-- Структура таблицы `habitat_type`
--

CREATE TABLE `habitat_type` (
  `id` int NOT NULL,
  `type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Виды мест обитания существ';

-- --------------------------------------------------------

--
-- Структура таблицы `language`
--

CREATE TABLE `language` (
  `id` int NOT NULL,
  `name` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Виды внутриигровых языков';

-- --------------------------------------------------------

--
-- Структура таблицы `legendary_action`
--

CREATE TABLE `legendary_action` (
  `id` int NOT NULL,
  `description` text NOT NULL COMMENT 'Описание легендарного действия существа',
  `id_npc` int NOT NULL COMMENT 'Существо, к которому привязано легендарное действие'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица легендарных действий существа';

-- --------------------------------------------------------

--
-- Структура таблицы `list_of_favorite_npc`
--

CREATE TABLE `list_of_favorite_npc` (
  `id` int NOT NULL,
  `id_npc` int NOT NULL,
  `id_user` int NOT NULL,
  `created_at` date NOT NULL COMMENT 'Дата добавления в список избранных'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Список избранных существ';

-- --------------------------------------------------------

--
-- Структура таблицы `npc`
--

CREATE TABLE `npc` (
  `id` int NOT NULL,
  `name_ru` varchar(63) NOT NULL COMMENT 'Название существа на русском',
  `name_eng` varchar(63) NOT NULL COMMENT 'Название существа на английском',
  `image` varchar(255) DEFAULT NULL COMMENT 'Ссылка на изображение',
  `danger_level` varchar(7) NOT NULL COMMENT 'Уровень опасности',
  `armor_class` int NOT NULL COMMENT 'Класс брони',
  `average_hits` int NOT NULL COMMENT 'Среднее количество хитов',
  `hit_dice_amount` int NOT NULL COMMENT 'Количество костей хитов',
  `hit_dice_type` int NOT NULL COMMENT 'Тип костей хитов (4, 6, 8, 10, 12, 20)',
  `hit_dice_modifier` int NOT NULL COMMENT 'Модификатор хитов (бонус к броску костей хитов)',
  `skill_bonus` int NOT NULL COMMENT 'Бонус мастерства',
  `strength` int NOT NULL COMMENT 'Значение силы',
  `dexterity` int NOT NULL COMMENT 'Значение ловкости',
  `constitution` int NOT NULL COMMENT 'Значение телосложения',
  `intelligence` int NOT NULL COMMENT 'Значение интеллекта',
  `wisdom` int NOT NULL COMMENT 'Значение мудрости',
  `charisma` int NOT NULL COMMENT 'Значение харизмы',
  `id_size` int NOT NULL COMMENT 'Размер',
  `id_species` int NOT NULL COMMENT 'Вид',
  `id_subspecies` int DEFAULT NULL COMMENT 'Подвид',
  `id_worldview` int NOT NULL COMMENT 'Мировоззрение',
  `id_created_by` int NOT NULL COMMENT 'Создатель (пользователь)',
  `is_approved_by_admin` bit(1) NOT NULL COMMENT 'Должно ли отображаться существо только при выборе пользовательских существ',
  `is_named` bit(1) NOT NULL COMMENT 'Является ли существо именованным'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Существа';

-- --------------------------------------------------------

--
-- Структура таблицы `npc_has_damage_immunity`
--

CREATE TABLE `npc_has_damage_immunity` (
  `id` int NOT NULL,
  `id_npc` int NOT NULL,
  `id_damage_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица, хранящая иммунитеты существ к определённому урону';

-- --------------------------------------------------------

--
-- Структура таблицы `npc_has_damage_resistance`
--

CREATE TABLE `npc_has_damage_resistance` (
  `id` int NOT NULL,
  `id_npc` int NOT NULL,
  `id_damage_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица, хранящая устойчивости существ к определённому урону';

-- --------------------------------------------------------

--
-- Структура таблицы `npc_has_damage_vulnerability`
--

CREATE TABLE `npc_has_damage_vulnerability` (
  `id` int NOT NULL,
  `id_npc` int NOT NULL,
  `id_damage_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица, хранящая уязвимости существ к определённому урону';

-- --------------------------------------------------------

--
-- Структура таблицы `npc_has_habitat`
--

CREATE TABLE `npc_has_habitat` (
  `id` int NOT NULL,
  `id_npc` int NOT NULL,
  `id_habitat_type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица, хранящая места обитания существ';

-- --------------------------------------------------------

--
-- Структура таблицы `npc_has_language`
--

CREATE TABLE `npc_has_language` (
  `id` int NOT NULL,
  `id_npc` int NOT NULL,
  `id_language` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица, хранящая языки, которыми обладают существа';

-- --------------------------------------------------------

--
-- Структура таблицы `npc_has_saving_throw`
--

CREATE TABLE `npc_has_saving_throw` (
  `id` int NOT NULL,
  `id_npc` int NOT NULL,
  `id_characteristic` int NOT NULL,
  `multiplier` double NOT NULL COMMENT 'Модификатор спасброска (значение, на которое умножается бонус мастерства)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица, показывающая владения спасбросками существ';

-- --------------------------------------------------------

--
-- Структура таблицы `npc_has_sense`
--

CREATE TABLE `npc_has_sense` (
  `id` int NOT NULL,
  `id_npc` int NOT NULL,
  `id_sense_type` int NOT NULL,
  `distance` int NOT NULL COMMENT 'Дистанция действия чувства'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица, показывающая чувства существ';

-- --------------------------------------------------------

--
-- Структура таблицы `npc_has_skill`
--

CREATE TABLE `npc_has_skill` (
  `id` int NOT NULL,
  `id_npc` int NOT NULL,
  `id_skill_type` int NOT NULL,
  `multiplier` double NOT NULL COMMENT 'Модификатор навыка (значение, на которое умножается бонус мастерства)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица, показывающая владения навыками существ';

-- --------------------------------------------------------

--
-- Структура таблицы `npc_has_speed`
--

CREATE TABLE `npc_has_speed` (
  `id` int NOT NULL,
  `id_npc` int NOT NULL,
  `id_speed_type` int NOT NULL,
  `value` int NOT NULL COMMENT 'Скорость'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица, хранящая скорости существ';

-- --------------------------------------------------------

--
-- Структура таблицы `sense_type`
--

CREATE TABLE `sense_type` (
  `id` int NOT NULL,
  `type` varchar(31) NOT NULL COMMENT 'Название чувства'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы чувств существ';

-- --------------------------------------------------------

--
-- Структура таблицы `size_type`
--

CREATE TABLE `size_type` (
  `id` int NOT NULL,
  `type` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы размеров существ';

-- --------------------------------------------------------

--
-- Структура таблицы `skill_type`
--

CREATE TABLE `skill_type` (
  `id` int NOT NULL,
  `type` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Навыки';

-- --------------------------------------------------------

--
-- Структура таблицы `species_type`
--

CREATE TABLE `species_type` (
  `id` int NOT NULL,
  `type` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Виды существ';

-- --------------------------------------------------------

--
-- Структура таблицы `speed_type`
--

CREATE TABLE `speed_type` (
  `id` int NOT NULL,
  `type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Способы перемещения существ';

-- --------------------------------------------------------

--
-- Структура таблицы `subspecies_type`
--

CREATE TABLE `subspecies_type` (
  `id` int NOT NULL,
  `id_species` int NOT NULL COMMENT 'Вид, к которому привязан подвид',
  `type` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Подвиды существ';

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `login` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` date NOT NULL COMMENT 'Дата создания аккаунта',
  `id_access_type` int NOT NULL COMMENT 'Тип доступа пользователя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Таблица пользователей';

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `email`, `password`, `created_at`, `id_access_type`) VALUES
(1, 'admin', 'admin@email', 'admin', '2023-11-02', 1),
(2, 'user1', 'user@email', '1234', '2023-11-02', 2),
(5, 'user2', 'user2@email', '1234', '2023-11-02', 2),
(9, 'user3', 'user3@email', '1234', '2023-11-02', 2),
(10, 'user4', 'user4@email', '1234', '2023-11-02', 2),
(16, 'user5', 'user5@email', '1234', '2023-11-02', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `worldview_type`
--

CREATE TABLE `worldview_type` (
  `id` int NOT NULL,
  `type` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Мировоззрения существ';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ability`
--
ALTER TABLE `ability`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `access_type`
--
ALTER TABLE `access_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `characteristic_for_saving_throw`
--
ALTER TABLE `characteristic_for_saving_throw`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `damage_type`
--
ALTER TABLE `damage_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `description`
--
ALTER TABLE `description`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_npc` (`id_npc`);

--
-- Индексы таблицы `habitat_type`
--
ALTER TABLE `habitat_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `legendary_action`
--
ALTER TABLE `legendary_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_npc` (`id_npc`);

--
-- Индексы таблицы `list_of_favorite_npc`
--
ALTER TABLE `list_of_favorite_npc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_npc` (`id_npc`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `npc`
--
ALTER TABLE `npc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_created_by` (`id_created_by`),
  ADD KEY `id_size` (`id_size`),
  ADD KEY `id_species` (`id_species`),
  ADD KEY `id_subspecies` (`id_subspecies`),
  ADD KEY `id_worldview` (`id_worldview`);

--
-- Индексы таблицы `npc_has_damage_immunity`
--
ALTER TABLE `npc_has_damage_immunity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_damage_type` (`id_damage_type`),
  ADD KEY `id_npc` (`id_npc`);

--
-- Индексы таблицы `npc_has_damage_resistance`
--
ALTER TABLE `npc_has_damage_resistance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_damage_type` (`id_damage_type`),
  ADD KEY `id_npc` (`id_npc`);

--
-- Индексы таблицы `npc_has_damage_vulnerability`
--
ALTER TABLE `npc_has_damage_vulnerability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_damage_type` (`id_damage_type`),
  ADD KEY `id_npc` (`id_npc`);

--
-- Индексы таблицы `npc_has_habitat`
--
ALTER TABLE `npc_has_habitat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_habitat_type` (`id_habitat_type`),
  ADD KEY `id_npc` (`id_npc`);

--
-- Индексы таблицы `npc_has_language`
--
ALTER TABLE `npc_has_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_language` (`id_language`),
  ADD KEY `id_npc` (`id_npc`);

--
-- Индексы таблицы `npc_has_saving_throw`
--
ALTER TABLE `npc_has_saving_throw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_characteristic` (`id_characteristic`),
  ADD KEY `id_npc` (`id_npc`);

--
-- Индексы таблицы `npc_has_sense`
--
ALTER TABLE `npc_has_sense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sense_type` (`id_sense_type`),
  ADD KEY `id_npc` (`id_npc`);

--
-- Индексы таблицы `npc_has_skill`
--
ALTER TABLE `npc_has_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_npc` (`id_npc`),
  ADD KEY `id_skill_type` (`id_skill_type`);

--
-- Индексы таблицы `npc_has_speed`
--
ALTER TABLE `npc_has_speed`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sense_type`
--
ALTER TABLE `sense_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `size_type`
--
ALTER TABLE `size_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `skill_type`
--
ALTER TABLE `skill_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `species_type`
--
ALTER TABLE `species_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `speed_type`
--
ALTER TABLE `speed_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subspecies_type`
--
ALTER TABLE `subspecies_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_species` (`id_species`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_access_type` (`id_access_type`);

--
-- Индексы таблицы `worldview_type`
--
ALTER TABLE `worldview_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ability`
--
ALTER TABLE `ability`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `access_type`
--
ALTER TABLE `access_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `action`
--
ALTER TABLE `action`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `characteristic_for_saving_throw`
--
ALTER TABLE `characteristic_for_saving_throw`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `damage_type`
--
ALTER TABLE `damage_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `description`
--
ALTER TABLE `description`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `habitat_type`
--
ALTER TABLE `habitat_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `language`
--
ALTER TABLE `language`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `legendary_action`
--
ALTER TABLE `legendary_action`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `list_of_favorite_npc`
--
ALTER TABLE `list_of_favorite_npc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `npc`
--
ALTER TABLE `npc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `npc_has_damage_immunity`
--
ALTER TABLE `npc_has_damage_immunity`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `npc_has_damage_resistance`
--
ALTER TABLE `npc_has_damage_resistance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `npc_has_damage_vulnerability`
--
ALTER TABLE `npc_has_damage_vulnerability`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `npc_has_habitat`
--
ALTER TABLE `npc_has_habitat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `npc_has_language`
--
ALTER TABLE `npc_has_language`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `npc_has_saving_throw`
--
ALTER TABLE `npc_has_saving_throw`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `npc_has_sense`
--
ALTER TABLE `npc_has_sense`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `npc_has_skill`
--
ALTER TABLE `npc_has_skill`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `npc_has_speed`
--
ALTER TABLE `npc_has_speed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sense_type`
--
ALTER TABLE `sense_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `size_type`
--
ALTER TABLE `size_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `skill_type`
--
ALTER TABLE `skill_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `species_type`
--
ALTER TABLE `species_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `speed_type`
--
ALTER TABLE `speed_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `subspecies_type`
--
ALTER TABLE `subspecies_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `worldview_type`
--
ALTER TABLE `worldview_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ability`
--
ALTER TABLE `ability`
  ADD CONSTRAINT `ability_ibfk_1` FOREIGN KEY (`id`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `action`
--
ALTER TABLE `action`
  ADD CONSTRAINT `action_ibfk_1` FOREIGN KEY (`id`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `description`
--
ALTER TABLE `description`
  ADD CONSTRAINT `description_ibfk_1` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `legendary_action`
--
ALTER TABLE `legendary_action`
  ADD CONSTRAINT `legendary_action_ibfk_1` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `list_of_favorite_npc`
--
ALTER TABLE `list_of_favorite_npc`
  ADD CONSTRAINT `list_of_favorite_npc_ibfk_1` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `list_of_favorite_npc_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `npc`
--
ALTER TABLE `npc`
  ADD CONSTRAINT `npc_ibfk_1` FOREIGN KEY (`id_created_by`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `npc_ibfk_2` FOREIGN KEY (`id_size`) REFERENCES `size_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `npc_ibfk_3` FOREIGN KEY (`id_species`) REFERENCES `species_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `npc_ibfk_4` FOREIGN KEY (`id_subspecies`) REFERENCES `subspecies_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `npc_ibfk_5` FOREIGN KEY (`id_worldview`) REFERENCES `worldview_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `npc_has_damage_immunity`
--
ALTER TABLE `npc_has_damage_immunity`
  ADD CONSTRAINT `npc_has_damage_immunity_ibfk_1` FOREIGN KEY (`id_damage_type`) REFERENCES `damage_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `npc_has_damage_immunity_ibfk_2` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `npc_has_damage_resistance`
--
ALTER TABLE `npc_has_damage_resistance`
  ADD CONSTRAINT `npc_has_damage_resistance_ibfk_1` FOREIGN KEY (`id_damage_type`) REFERENCES `damage_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `npc_has_damage_resistance_ibfk_2` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `npc_has_damage_vulnerability`
--
ALTER TABLE `npc_has_damage_vulnerability`
  ADD CONSTRAINT `npc_has_damage_vulnerability_ibfk_1` FOREIGN KEY (`id_damage_type`) REFERENCES `damage_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `npc_has_damage_vulnerability_ibfk_2` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `npc_has_habitat`
--
ALTER TABLE `npc_has_habitat`
  ADD CONSTRAINT `npc_has_habitat_ibfk_1` FOREIGN KEY (`id_habitat_type`) REFERENCES `habitat_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `npc_has_habitat_ibfk_2` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `npc_has_language`
--
ALTER TABLE `npc_has_language`
  ADD CONSTRAINT `npc_has_language_ibfk_1` FOREIGN KEY (`id_language`) REFERENCES `language` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `npc_has_language_ibfk_2` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `npc_has_saving_throw`
--
ALTER TABLE `npc_has_saving_throw`
  ADD CONSTRAINT `npc_has_saving_throw_ibfk_1` FOREIGN KEY (`id_characteristic`) REFERENCES `characteristic_for_saving_throw` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `npc_has_saving_throw_ibfk_2` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `npc_has_sense`
--
ALTER TABLE `npc_has_sense`
  ADD CONSTRAINT `npc_has_sense_ibfk_1` FOREIGN KEY (`id_sense_type`) REFERENCES `sense_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `npc_has_sense_ibfk_2` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `npc_has_skill`
--
ALTER TABLE `npc_has_skill`
  ADD CONSTRAINT `npc_has_skill_ibfk_1` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `npc_has_skill_ibfk_2` FOREIGN KEY (`id_skill_type`) REFERENCES `skill_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `subspecies_type`
--
ALTER TABLE `subspecies_type`
  ADD CONSTRAINT `subspecies_type_ibfk_1` FOREIGN KEY (`id_species`) REFERENCES `species_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_access_type`) REFERENCES `access_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
