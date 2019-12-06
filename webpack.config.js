const path = require('path')

module.exports = {
  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],

        use: [
          { loader: 'elm-hot-webpack-loader' },
          { loader: 'elm-webpack-loader' }
        ]
      }
    ]
  },

  devServer: {
    contentBase: path.join(__dirname, 'dist'),
    port: 9000,
    hot: true
  }
}
