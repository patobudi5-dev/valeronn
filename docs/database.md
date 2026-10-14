# Проектирование структуры базы данных «Прокат автомобилей»

## 1. ER-диаграмма данных (PlantUML)
Текстовый код для визуализации связей между таблицами базы данных.

```plantuml
@startuml
hide circle
skinparam linetype ortho

entity "Cars (Автомобили)" as cars {
  * car_id : INT (PK)
  --
  * brand : VARCHAR (Марка)
  * model : VARCHAR (Модель)
  * license_plate : VARCHAR (Госномер)
  * year : INT (Год выпуска)
  * car_class : VARCHAR (Класс авто)
  * daily_rate : DECIMAL (Тариф в сутки)
  * status : VARCHAR (Статус: Доступен/В прокате/ТО)
}

entity "Clients (Клиенты)" as clients {
  * client_id : INT (PK)
  --
  * full_name : VARCHAR (ФИО)
  * phone : VARCHAR (Телефон)
  * email : VARCHAR (Email)
  * passport_data : VARCHAR (Паспорт)
  * driving_experience : INT (Стаж вождения)
  * registration_date : DATE (Дата регистрации)
}

entity "Bookings (Бронирования)" as bookings {
  * booking_id : INT (PK)
  --
  * car_id : INT (FK) -> Cars
  * client_id : INT (FK) -> Clients
  * start_date : DATE (Дата начала)
  * end_date : DATE (Дата окончания)
  * total_cost : DECIMAL (Итоговая стоимость)
  * deposit_amount : DECIMAL (Сумма залога)
  * status : VARCHAR (Статус заказа)
}

entity "Reviews (Отзывы)" as reviews {
  * review_id : INT (PK)
  --
  * booking_id : INT (FK) -> Bookings
  * rating : INT (Оценка 1-5)
  * comment : TEXT (Комментарий)
  * created_at : TIMESTAMP (Дата отзыва)
}

cars "1" -- "0..*" bookings : "бронируется в"
clients "1" -- "0..*" bookings : "оформляет"
bookings "1" -- "0..1" reviews : "получает"
@endum
```

## 2. Спецификация таблиц (Словарь данных)

### Таблица 1: `Cars` (Автомобили компании)
- `car_id` (Primary Key, INT): Уникальный номер автомобиля.
- `brand` (VARCHAR): Марка машины (например, Hyundai).
- `model` (VARCHAR): Модель машины (например, Solaris).
- `license_plate` (VARCHAR, Unique): Государственный регистрационный знак.
- `car_class` (VARCHAR): Класс комфорта (Эконом / Комфорт / Бизнес).
- `daily_rate` (DECIMAL): Стоимость аренды за одни сутки в рублях.
- `status` (VARCHAR): Текущее состояние (Доступен / В прокате / На ТО / В ремонте).

### Таблица 2: `Clients` (Зарегистрированные водители)
- `client_id` (Primary Key, INT): Уникальный номер клиента.
- `full_name` (VARCHAR): ФИО клиента.
- `phone` (VARCHAR): Контактный номер телефона.
- `email` (VARCHAR): Адрес электронной почты для уведомлений.
- `driving_experience` (INT): Стаж вождения в годах (для проверки ограничений).

### Таблица 3: `Bookings` (Заказы на аренду)
- `booking_id` (Primary Key, INT): Уникальный номер бронирования.
- `car_id` (Foreign Key, INT): Ссылка на арендованный автомобиль.
- `client_id` (Foreign Key, INT): Ссылка на клиента, оформившего заказ.
- `start_date` (DATE): Дата начала аренды.
- `end_date` (DATE): Дата окончания аренды.
- `total_cost` (DECIMAL): Автоматически рассчитанная полная стоимость проката.
- `status` (VARCHAR): Статус заказа (Новый / Подтвержден / Активен / Завершен / Отменен).
