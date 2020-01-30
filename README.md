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
## Execels headers:

## vocabulary: 
### flash_card
    - word       
    - Hiragana   
    <!-- sino how to call -->
    <!-- ipa  pronunciation -->
    <!-- example -->
    <!-- add: word_des -->

### card_translations
    - meaning_vi  
    <!-- sino_vi -->
    <!-- ex_meaning -->
    - language_id
    - flash_card_id

## grammar:

### flash_card
    - grammar       | ~ word
    - structure     | ~ hiragana
    <!-- - example       | ~ example -->

### card_translations
    - meaning_vi    | ~ meaning
    <!-- - explanation   | ~> *need*: des => card_translations -->
    <!-- - ex_meaning    | ~ ex_meaning -->
    - language_id
    - flash_card_id

    <!-- sino_vi -->