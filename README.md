# README

<!-- This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
# Import data by Upload Excels
## import to existed Lesson
* POST http://{ip}/import?lesson_id=2&level_id=6&lang_code='ja'
    - Body: 
    {   "lesson_id": 2,
        "headers": [
            "no",
            "word",
            "hiragana",
            "meaning_vi",
            null,
            null
        ],
        "data": [
            [
                1,
                "人生",
                "じんせい",
                "cuộc sống",
                null,
                null
            ],
        ]
    }
## Import to new Lesson with existed Course
* Front_end: create new Lesson with course_id
## Import to new Course & new Lesson
* Front_end: create new Course & new Lesson

## Excels headers:

## Type 1: vocabulary
### flash_card
    - word       
    - Hiragana?   
    <!-- sino how to call -->
    <!-- ipa  pronunciation -->
    <!-- example -->
    <!-- add: word_des -->

### card_translations
    - meaning
    <!-- sino_vi -->
    <!-- ex_meaning -->
    - language_id
    - flash_card_id

## Type 2: grammar

### flash_card
    - grammar       | ~ word
    - structure?     | ~ hiragana
    <!-- - example       | ~ example -->

### card_translations
    - meaning
    <!-- explanation   | ~> *need*: des -->
    <!-- ex_meaning    | ~ ex_meaning -->
    - language_id
    - flash_card_id

    <!-- sino_vi -->