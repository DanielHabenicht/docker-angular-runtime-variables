declare var ENV;

export const runtimeEnvironment = {
  test: ENV.test === '${TEST_ENV}' ? false : ENV.test
};
