# DataX Demo

## How to develop in local?
1. Create virtual environment (recommend: python 3.11)

    ```$ python -m venv venv```

2. Activate virtual environment

3. Install dependencies

    ```$ pip install -r requirements.txt```

4. Run `$ dbt debug` for connection test. "All checks passed!" should be displayed. If not try adding dbt profiles (`~/.dbt/profiles.yml), named `dataxdemo`.

    ```yml
    ...
    dataxdemo:
    outputs:
        dev:
        catalog: catalog_develop
        host: <SERVER HOSTNAME>
        http_path: <HTTP_PATH>
        schema: default
        threads: 4
        token: <PERSONAL_ACCESS_TOKEN>
        type: databricks
    target: dev
    ...
    ```

5. Run `$ dbt deps` to install dependencies.
6. Run `$ dbt run` to run transformation.
7. Run `$ dbt test` to run test.
8. Run `$ dbt docs generate` to generate documents.
9. Run `$ dbt build` to run through all steps in production.
