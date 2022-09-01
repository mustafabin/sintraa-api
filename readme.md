# One Piece API

### RESTful api that uses [faker data](https://github.com/faker-ruby/faker/blob/master/doc/japanese_media/one_piece.md) to randomly generate One Piece characters and devil fruits

> This is a sinatra api with active record as the (orm) on a sqlite database

# Getting started

install project dependencies

    $ bundle install

migrate database then seed data

    $ rake db:migrate
    $ rake db:seed

run sinatra server

    $ rake server

# Usage

## All Routes

- [`/characters` - All Characters](#/characters)
- [`/characters/:id` - One Character with their devil fruit(s)](#/detail)
- [`/fruits` - All stored devil fruits](#/fruits)
- [`/eat-devil-fruit` - Give Character a devil fruit](#/eat-devil-fruit)
- [`/destory-character/:id` - Deletes Character](#/destory-character/:id)
- [`/update-character` - Updates Character](#/update-character)

<div id='/characters'></div>

### `/characters` – All Characters

**Link**

- `http://127.0.0.1:9292/characters`

#### Method

| URI          | HTTP Method | Headers |
| ------------ | ----------- | ------- |
| `characters` | GET         | None    |

#### Request Parameters

| Parameter | Type | Description | Required? |
| --------- | ---- | ----------- | --------- |
| ---       | ---  | ---         | ---       |

**Example Response:**

```JSON
[
     {
        "id": 30,
        "name": "Dracule Mihawk",
        "email": "DraculeMihawk@bounty.com",
        "password": "If I can't even protect my captain's dream, then whatever ambition I have is nothing but talk! Luffy must be the man who becomes the Pirate King!",
        "created_at": "2022-08-31T21:06:27.566Z",
        "updated_at": "2022-08-31T21:06:27.566Z"
    },
    {
        "id": 31,
        "name": "Bartholomew Kuma",
        "email": "BartholomewKuma@bounty.com",
        "password": "To true friendship, how long you've known each other means nothing.",
        "created_at": "2022-08-31T21:06:27.568Z",
        "updated_at": "2022-08-31T21:06:27.568Z"
    }
]
```

<div id='/detail'></div>

### `/characters/:id` – All Characters

**Link**

- `http://127.0.0.1:9292/characters/1`

#### Method

| URI              | HTTP Method | Headers |
| ---------------- | ----------- | ------- |
| `characters/:id` | GET         | None    |

#### Request Parameters

| Parameter | Type | Description | Required? |
| --------- | ---- | ----------- | --------- |
| id        | Int  | ---         | yes       |

**Example Response:**

```JSON
{
    "user": {
        "id": 31,
        "name": "Magellan",
        "email": "Magellan@bounty.com",
        "password": "toilet",
        "created_at": "2022-08-31T21:06:27.568Z",
        "updated_at": "2022-09-01T16:20:22.303Z"
    },
    "fruits": [
        {
            "id": 26,
            "name": "Doku Doku no Mi",
            "user_id": "31",
            "created_at": "2022-08-31T21:06:27.571Z",
            "updated_at": "2022-08-31T21:06:27.571Z"
        }
    ]
}
```

<div id='/fruits'></div>

### `/fruits` – All Characters

**Link**

- `http://127.0.0.1:9292/fruits`

#### Method

| URI      | HTTP Method | Headers |
| -------- | ----------- | ------- |
| `fruits` | GET         | None    |

#### Request Parameters

| Parameter | Type | Description | Required? |
| --------- | ---- | ----------- | --------- |
| ---       | ---  | ---         | ---       |

**Example Response:**

```JSON
[
    {
        "id": 21,
        "name": "Ishi Ishi no Mi",
        "user_id": "26",
        "created_at": "2022-08-31T21:06:27.559Z",
        "updated_at": "2022-08-31T21:06:27.559Z"
    },
    {
        "id": 22,
        "name": "Ori Ori no Mi",
        "user_id": "27",
        "created_at": "2022-08-31T21:06:27.561Z",
        "updated_at": "2022-08-31T21:06:27.561Z"
    },
    {
        "id": 23,
        "name": "Giro Giro no Mi",
        "user_id": "28",
        "created_at": "2022-08-31T21:06:27.562Z",
        "updated_at": "2022-08-31T21:06:27.562Z"
    }
]
```

<div id='/eat-devil-fruit'></div>

### `/eat-devil-fruit` – All Characters

**Link**

- `http://127.0.0.1:9292/eat-devil-fruit`

#### Method

| URI               | HTTP Method | Headers |
| ----------------- | ----------- | ------- |
| `eat-devil-fruit` | POST        | None    |

#### Example Body

```JSON
{
    "user_id": 33,
    "devil_fruit":"Hito Hito no mi"
}
```

**Example Response:**

```JSON
{
    "user": {
        "id": 33,
        "name": "Trafalgar D. Water Law",
        "email": "TrafalgarD.WaterLaw@bounty.com",
        "password": "Stop counting only those things you have lost! What is gone, is gone! So ask yourself this. What is there... that still remains to you?!",
        "created_at": "2022-08-31T21:06:27.575Z",
        "updated_at": "2022-08-31T21:06:27.575Z"
    },
    "fruits": [
        {
            "id": 28,
            "name": "Pika Pika no Mi",
            "user_id": "33",
            "created_at": "2022-08-31T21:06:27.578Z",
            "updated_at": "2022-08-31T21:06:27.578Z"
        },
        {
            "id": 37,
            "name": "Hito Hito no mi",
            "user_id": "33",
            "created_at": "2022-09-01T20:01:55.997Z",
            "updated_at": "2022-09-01T20:01:55.997Z"
        }
    ]
}
```

<div id='/update-character'></div>

### `/update-character` – Update character data

**Link**

- `http://127.0.0.1:9292/update-character`

#### Method

| URI                | HTTP Method | Headers |
| ------------------ | ----------- | ------- |
| `update-character` | PUT         | None    |

#### Example Body

```JSON
{
    "user_id": 33,
    "name": "Usopp",
    "email":"Usopp@elbaf.eastblue",
    "password":"I never Lie"
}
// If only one field exists then only that field is updated and the rest default to there previous values
```

**Example Response:**

```JSON
{
    "name": "Usopp",
    "email": "Usopp@elbaf.eastblue",
    "password": "I never Lie",
    "id": 33,
    "created_at": "2022-08-31T21:06:27.575Z",
    "updated_at": "2022-09-01T20:26:55.515Z"
}
```
