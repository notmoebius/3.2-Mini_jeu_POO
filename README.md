# Scrapper

A scrapper program that can do the following:
* Scrape cryptocurencies from [coinmarketcap.com](https://coinmarketcap.com/all/views/all/) and return them in an array of hashes in
* Scrape townhalls emails from [annuaire-des-mairies.com](https://www.annuaire-des-mairies.com) and retun them in an array of hashes in
* Scrape deputies infos (first name, last name, email) from [assembless-nationale.fr](http://www2.assemblee-nationale.fr/deputes/liste/alphabetique) and return them in an array of hashesformat.


## Getting Started
```
# Clone this repository
$ git clone

# Go into the repository
$ cd 2.4-Scrapping

# Install dependencies
$ bundle install
```

### Example

Scrape all deputies informations

```
$ cd/lib
$ ruby deputy.rb
```
## Running the tests

Get to the root of the repository, then run:

```
$ rspec spec/crypto_scrapper_spec.rb
```
and
```
$ rspec spec/mairie_christmas_spec.rb
```
and
```
$ rspec spec/deputy_spec.rb
```
### What are these tests and why

These tests make sure:
* The program's output
...Neither empty nor nil
... An array of hashes
* The output is what's expected
...A minimum amount of data retrieved
...Hashes haven't nil or empty keys and values

## Author

* **Georges Atalla** - [Ggs91](https://github.com/Ggs91/)
