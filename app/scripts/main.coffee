require.config
  paths:
    "react": "vendor/react/react-with-addons"
    "d3": "vendor/d3/d3.min"
    "underscore": "vendor/underscore/underscore"

define ["react", "components/root"], (React, Root) ->
  React.renderComponent Root(), document.body
