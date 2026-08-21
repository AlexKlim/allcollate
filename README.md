# AllCollate

A hotel search that keeps the prices as well as the hotels.

Most hotel sites show you what a room costs right now. AllCollate collected
the listings along with their prices over time, so you could tell whether
today's price was actually a good one before booking.

A side project, built with a friend from 2020. I no longer host it, but
everything needed to run it locally is in the repository, including a
database dump.

## What it does

- Imports hotel listings, rates, ratings, brands and locations from a
  partner feed
- Keeps the price history rather than only the current rate
- Indexes hotels, brands and locations in Elasticsearch for search
- Collects statistics on a schedule through background workers
- Serves all of it through a Rails application with a React front end

## How it is built

| Part | What we use |
|---|---|
| Application | Ruby on Rails |
| Front end | React, rendered through react-rails |
| Database | PostgreSQL |
| Search | Elasticsearch, through Chewy |
| Background jobs | Sidekiq |
| Hosting | AWS |

Server side rendering is used wherever it is useful, so pages arrive
rendered rather than assembled in the browser.

## Setup

You need Ruby 2.7.1, Node.js 12.16.1, Yarn and PostgreSQL. rvm works fine
for Ruby.

Create the database:
