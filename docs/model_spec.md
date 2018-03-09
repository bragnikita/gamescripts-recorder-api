# Типы

## Character
```
id
fullname
display_name
prefixes
avatar -> Image
color: css_color
scopes
created_by -> User
```

## CharacterList
Формируемый пользователем список кандидатов на действующие персонажи
```
id
name
scopes
characters <-> Character
owner -> User
```

## Script
```
id
title
script_data
characters <-> Character //фактически добавленные
candidate_list -> CharacterList //добавленные юзером в кандидаты
owner -> User
scopes
```

## Image
+CarrierWave
```
id
image_link
type
```

## User
```
id
username
password
is_admin
is_active
```

## Scope
```
id
name
```