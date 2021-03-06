# ARTK
*A rails engine for Archivists' Toolkit*

Provides a minimal RESTful interface to some of the tables in the Archivist's Toolkit database

## Usage

You can access finding aids, their components and accessions via URLs such as

    /artk/resources

which returns a list of all finding aids, something like

    [[{"ARC-0030":"Terry Stewart Collection"},{"ARC-0001":"Art Collins Papers"},{"ARC-0003":"Milt Gabler Papers"}]

or you can access a single finding aid in the `Resources` table by using    

    /artk/resources/ARC-0001

which will return json for the `ARC-0001` record in the `Resources` table of the AT database.  You may also
get a listing of all the non-item level components of a finding aid by going to

    /artk/resources/ARC-0001/components

which will return something like

    [{"ref1":"Series I: Iggy Pop [RESTRICTED]"},{"ref4":"Series II: Marianne Faithfull [RESTRICTED]"}]

or an identifier and title for each component in the collection.

## Installation

Add the gem to your Rails gemfile

    gem 'artk'

And then add the engine to your application

    mount Artk::Engine => '/artk'

Configure the gem to connect to your Archivists' Toolkit database by editing `config/database.yml` and adding these lines: 

    artk_development:
      adapter: mysql2
      encoding: utf8
      reconnect: false
      database: atk
      pool: 5
      username: root
      password: password 
      host: localhost

    artk_test:
      adapter: mysql2
      encoding: utf8
      reconnect: false
      database: bl_test
      pool: 5
      username: root
      password: password
      host: localhost

    artk_production:
      adapter: mysql2
      encoding: utf8
      reconnect: false
      database: bl_prod
      pool: 5
      username: root
      password: password
      host: localhost

The above configuration is for Mysql, so your adapater may vary, and you'll need to change these username,
password, and host values to match your environment.  Using this configuration allows you to keep your databases
separate.  For example, the Rails database for your application would be defined by the `developement` yaml
value, while the Archivists' Toolkit database by the `artk_development` yaml value, and so forth with the other
environments.

To be safe, you might want to use a username for the Toolkit connection that has only SELECT rights,
and avoid any possibility of the Rails application trying to make changes to the wrong database.

## Contributing

This was written to meet our own local needs, but I welcome patches, feature requests, etc.  At the moment, testing is based
on our own AT database, which prevents continuous integration testing.  Please submit issues as you see fit.

## TODO

* Use test that don't require a local AT install
* Sanitize query parameters
* Better searching

## Copyright

(c) 2013 Adam Wead
