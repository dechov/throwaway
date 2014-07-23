require.config
  paths:
    "d3": "vendor/d3/d3.min"
    "underscore": "vendor/underscore/underscore"
    "react": "vendor/react/react-with-addons"

define ["react", "components/root"], (React, Root) ->
  React.renderComponent Root(), document.body
