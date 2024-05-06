# Take Home Test - BI Challenge

## model structure:

- staging layer
- aggregation layer

## installation

1. Set up Virtual Environemtn

```
   python -m venv env
   env/bin/activate
   pip install -r requirements.txt
```

2. Set up database:

```
   docker-compose up -d
```

3. Set up dbt profile

- set environmental variables in .env
  [DBT_TARGET]
  [DBT_PROFILES_DIR]
  [postgres_HOST]
  [postgres_USER]
  [postgres_PASSWORD]
  [postgres_PORT]
  [postgres_DBNAME]
  [postgres_SCHEMA]

- add below line to automatically setup environmental variable with Virtual Environment
  ```
  Get-Content .env | ForEach-Object { $key, $value = $_ -split '=',2; [System.Environment]::SetEnvironmentVariable($key, $value, [System.EnvironmentVariableTarget]::Process) }
  ```

4. set up dbt project
   create folders for models/analyses/tests/seeds/macros/snapshots and run dbt debug

5. load data through dbt seed
   set up dbt_project.yml and run dbt seeds

6. setup packages through
   set up packages.yml and run dbt deps
