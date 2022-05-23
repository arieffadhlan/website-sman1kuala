const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
    ],

    theme: {
        extend: {
            screens: {
                'lgMax': {'max': '1024px'},
                'xs': '480px',
                '2xs': {'max': '364px'}
            },
            fontFamily: {
                sans: ['Inter', ...defaultTheme.fontFamily.sans],
            },
            colors: {
                dashboard: "#064e3b",
                primary: "#252F3F",
                secondary: "#51B36D",
                neutral: "#757575",
            }
        },
    },

    plugins: [
        require('@tailwindcss/forms'),
        require('flowbite/plugin')
    ],
};
