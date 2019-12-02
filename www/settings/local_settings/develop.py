# coding=utf8
"""开发环境配置"""

DATABASES = {
    'default': {
        "ENGINE": 'django.db.backends.mysql',
        "HOST": "127.0.0.1",
        "PORT": 3306,
        "USER": "root",
        "PASSWORD": "123456",
        "DATABASE_CHARSET": "utf8",
        "NAME": "risk_control",
    },
}

DEBUG = True
