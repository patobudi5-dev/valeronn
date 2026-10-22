# Проектирование структуры базы данных «Прокат автомобилей»

## 1. ER-диаграмма данных (PlantUML)
Текстовый код для визуализации связей между таблицами базы данных.

```mermaid
erDiagram
    CARS {
        int car_id PK
        string brand
        string model
        string license_plate
        int year
        string car_class
        decimal daily_rate
        string status
    }
    CLIENTS {
        int client_id PK
        string full_name
        string phone
        string email
        int driving_experience
    }
    BOOKINGS {
        int booking_id PK
        int car_id FK
        int client_id FK
        date start_date
        date end_date
        decimal total_cost
        string status
    }

    CARS ||--o{ BOOKINGS : "бронируется в"
    CLIENTS ||--o{ BOOKINGS : "оформляет"
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
