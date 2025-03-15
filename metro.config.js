/**
 * Metro configuration for React Native
 * https://facebook.github.io/metro/docs/configuration
 */
module.exports = {
    transformer: {
      babelTransformerPath: require.resolve('metro-react-native-babel-transformer'),
    },
  };
  