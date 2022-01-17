module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'e9db2df827b0d595ef4c953dd5de1589'),
  },
});
