# Gomplate GitHub Action

![Gomplate Action](https://img.shields.io/github/v/release/ammarlakis/action-gomplate)

A GitHub Action for running [Gomplate](https://github.com/hairyhenderson/gomplate), a powerful template rendering tool that supports JSON, YAML, environment variables, and more.

## Features
- Run Gomplate in a GitHub Actions workflow
- Support for multiple data sources (JSON, YAML, environment variables, etc.)
- Configurable input and output files
- Custom CLI options

## Usage

### Basic Example
```yaml
name: Run Gomplate
on: [push]

jobs:
  render-template:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Run Gomplate Action
        uses: ammarlakis/action-gomplate@v1
        with:
          input_file: './templates/sample.tmpl'
          output_file: './output/rendered.txt'
          data_sources: 'json=data.json'
```

### Passing Multiple Data Sources
#### Comma-separated values
```yaml
      - name: Run Gomplate Action
        uses: ammarlakis/action-gomplate@v1
        with:
          input_file: './templates/sample.tmpl'
          output_file: './output/rendered.txt'
          data_sources: 'json=data.json,yaml=config.yaml'
```

#### Multi-line YAML values
```yaml
      - name: Run Gomplate Action
        uses: ammarlakis/action-gomplate@v1
        with:
          input_file: './templates/sample.tmpl'
          output_file: './output/rendered.txt'
          data_sources: |
            json=data.json
            yaml=config.yaml
```

## Inputs

| Name         | Description                                      | Required | Default         |
|-------------|--------------------------------------------------|----------|-----------------|
| `input_file`  | Path to the template file                      | Yes    | -               |
| `output_file` | Path to the output file                        | No     | `output.txt`    |
| `data_sources` | Data sources for Gomplate (comma/newline-separated) | No     | -               |
| `options`     | Additional Gomplate CLI options                | No     | -               |

## Output
The rendered template will be saved to the `output_file` path specified.

## License
This project is licensed under the [MIT License](LICENSE).

## Support
If you find this action useful, consider giving it a star on GitHub!
