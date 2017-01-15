// import {
//     Configuration as WebpackConfig,
// } from 'webpack'
import 'ts-helpers'

type WebpackConfig = any

const path = require('path')

const { CheckerPlugin } = require('awesome-typescript-loader')
const ExtractTextPlugin = require('extract-text-webpack-plugin')

// Environment
const PROD = process.env.NODE_ENV === 'production'

console.log("Running in Production:", PROD ? "YES" : "NO")

const extractSass = new ExtractTextPlugin({
    filename: "css/[name].css",
    disable: !PROD
})

console.log(root('web/static/css/main.scss'))

const config: WebpackConfig = {
    entry: {
        app: root('web/static/js/entry.ts'),
    },

    output: {
        path: root('priv/static'),
        publicPath: '/static',
        filename: 'js/[name].js'
    },

    context: root('web/static'),

    devtool: PROD ? 'source-map' : 'eval',

    // Currently we need to add '.ts' to the resolve.extensions array.
    resolve: {
        extensions: ['.ts', '.tsx', '.js', '.jsx', '.scss']
    },

    module: {
        rules: [
            { test: /\.scss$/,
                loader: extractSass.extract({ loader: [ "css-loader", {
                        loader: "sass-loader",
                        options: {
                            includePaths: [ root('web/static/css') ]
                        }
                    }],
                    fallbackLoaders: "style-loader"
                })
            },
            { test: /\.ts$/, loader: 'awesome-typescript-loader', exclude: root('web/static/css') },
        ]
    },
    plugins: [
        extractSass,
        new CheckerPlugin()
    ]
}

export default config

function root(...args) {
    return path.resolve(__dirname, ...args)
}
