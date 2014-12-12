erlang-solutions:
  cmd.run:
    - names:
      - dpkg -i /tmp/erlang-solutions_1.0_all.deb
      - apt-get update
    - require:
      - file: /tmp/erlang-solutions_1.0_all.deb

/tmp/erlang-solutions_1.0_all.deb:
  file.managed:
    - source: http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
    - source_hash: sha1=ad726c8459c63bfe1dc3d6e16265560bbc392a53

erlang:
  pkg.installed:
    - require:
      - cmd: erlang-solutions

erlang-ssl:
  pkg.installed:
    - require:
      - pkg: erlang

erlang-inets:
  pkg.installed:
    - require:
      - pkg: erlang
