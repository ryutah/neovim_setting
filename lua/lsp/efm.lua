local prettierd = {
  formatStdin = true,
  formatCommand = "prettierd '${INPUT}'",
  rootMarkers = {
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yaml",
    ".prettierrc.yml",
    ".prettierrc.js",
    ".prettierrc.cjs",
    ".prettierrc.mjs",
    ".prettierrc.toml",
  },
}

local markdownlint = {
  lintStdin = false,
  lintIgnoreExitCode = true,
  lintSeverity = 3,
  lintCommand = "markdownlint ${INPUT}",
  lintFormats = {
    "%f:%l %m",
    "%f:%l:%c %m",
    "%f: %l: %m",
  },
  rootMarkers = {
    ".markdownlint.jsonc",
    ".markdownlint.json",
    ".markdownlint.yaml",
    ".markdownlint.yml",
    ".markdownlintrc",
  }
}

local textlint = {
  lintStdin = false,
  lintSeverity = 4,
  lintCommand = "npx textlint --format unix ${INPUT}",
  lintFormats = {
    "%f:%l:%c: %m",
  },
  lintIgnoreExitCode = true,
  rootMarkers = {
    ".textlintrc.json",
  }
}

local sql_formatter = {
  formatStdin = true,
  formatCommand = [[
      if [ -e sql_formatter.json ]; then
        sql-formatter -c sql_formatter.json
      elif [ -e .sql_formatter.json ]; then
        sql-formatter -c .sql_formatter.json
      else
        sql-formatter
      fi
  ]],
  rootMarkers = {
    "sql_formatter.json",
    ".sql_formatter.json",
  },
}

local sqlfluff = {
  formatStdin = true,
  formatCommand = "sqlfluff format -",
  rootMarkers = {
    ".sqlfluff",
    "pyproject.toml",
    "pep8.ini",
    "tox.ini",
    "setup.cfg",
  },
}

local shfmt = {
  formatStdin = true,
  formatCommand = "shfmt -i 2",
}

local buf_lint = {
  prefix = "buf",
  lintStdin = true,
  lintCommand = "buf lint --error-format github-actions '${INPUT}'",
  lintFormats = {
    "::%totice file=%f,line=%l,col=%c,endLine=%e,endColumn=%k::%m",
    "::%tarning file=%f,line=%l,col=%c,endLine=%e,endColumn=%k::%m",
    "::%trror file=%f,line=%l,col=%c,endLine=%e,endColumn=%k::%m",
    "::%totice file=%f::%m",
    "::%tarning file=%f::%m",
    "::%trror file=%f::%m",
  },
  rootMarkers = {
    "buf.yaml",
  },
}


local hadolint = {
  lintStdin = true,
  lintCommand = "hadolint --no-color -",
  lintSeverity = 2,
  lintFormats = {
    "%f:%l %m",
    "%f:%l:%c %m",
  },
}

return require('lsp.utils').config({
  lsp = {
    filetypes = {
      'yaml',
      'html',
      'css',
      'markdown',
      'sql',
      'sh',
      'proto',
      'dockerfile'
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true
    },
    settings = {
      rootMarkers = { '.git/' },
      languages = {
        yaml = { prettierd },
        html = { prettierd },
        css = { prettierd },
        markdown = {
          prettierd,
          markdownlint,
          textlint,
        },
        sql = { sqlfluff },
        sh = { shfmt },
        proto = { buf_lint },
        dockerfile = { hadolint }
      }
    }
  }
})
