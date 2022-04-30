# **dm-rfm-segments**

## Overview

Витрина для RFM-классификации пользователей, на основе только успешно выполненных заказов.

**RFM** (англ. Recency Frequency Monetary* Value — давность, частота, деньги) — сегментация клиентов в анализе сбыта по лояльности.

## Структура таблицы

Атрибут|Тип|Ограничение|Описание
---|---|---|---
user_id|integer|primary key|Идентификатор пользователя 
recency|smallint|check (recency is not null and recency between 1 and 5)|Фактор давности заказа. Определяется по последнему заказу. Принимает значения от 1(нет закзов либо заказы были сделаны давно) до 5(заказы сделаны относительно недавно)
frequency|smallint|check (frequency is not null and frequency  between 1 and 5)|Фактор количество заказов. Принимает значения от 1(наименьшее) до 5(наибольшее)
monetary_value|smallint|check (monetary_value is not null and monetary_value between 1 and 5)|Фактор потраченной суммы на заказы. Принимает значения от 1(наименьшее) до 5(наибольшее)

## Параметры хранения

Наименование|Описание
---|---
База данных|PostgreSQL
Название базы|de
Название схемы|analysis
Глубина хранения|с 2021 года
Срок хранения|Постоянно
Регламент|Обновление по запросу

## Источники

Наименование|Описание
---|---
analysis.Orders|Представление таблицы production.Orders

## Описание источников

**analysis.Orders**

Атрибут|Тип|Ограниечение|Описание
---|---|---|---
order_id|integer|primary key|Идентификатор заказа
cost|numeric(19, 5)|check (cost = payment + bonus_payment)|Стоимость заказа
order_ts|timestamp|-|Дата и время получение заказом данного статуса
status|integer|-|Статус заказа
user_id|integer|-|Идентификатор пользователя


