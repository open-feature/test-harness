package Core

const fulA = `
{
  "flags": {
    "booleanFlag": {
      "state": "ENABLED",
      "variants": {
        "on": true,
        "off": false
      },
      "defaultVariant": "on"
    },
    "intFlag": {
      "state": "ENABLED",
      "variants": {
        "first": 1,
        "second": 2
      },
      "defaultVariant": "first"
    }
  }
}`

const add = `{
  "flags": {
    "booleanFlag2": {
      "state": "ENABLED",
      "variants": {
        "on": true,
        "off": false
      },
      "defaultVariant": "off"
    }
  }
}`

const fullB = `
{
  "flags": {
    "booleanFlag": {
      "state": "ENABLED",
      "variants": {
        "on": true,
        "off": false
      },
      "defaultVariant": "on"
    },
    "intFlag": {
      "state": "ENABLED",
      "variants": {
        "first": 1,
        "second": 2
      },
      "defaultVariant": "first"
    },
    "intFlag2": {
      "state": "ENABLED",
      "variants": {
        "first": 100,
        "second": 200
      },
      "defaultVariant": "first"
    }
  }
}`

const remove = `
{
  "flags": {
    "booleanFlag2": {
      "state": "ENABLED",
      "variants": {
        "on": true,
        "off": false
      },
      "defaultVariant": "off"
    }
  }
}`
