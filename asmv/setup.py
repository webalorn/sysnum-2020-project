import setuptools
import os
from pathlib import Path
import importlib.util

setuptools.setup(
    name="asmv",
    version="0.0.1",
    description=
    "I just wanted to create a custom ASM for my risc-v like proc plz don't hurt me it is not this bad, is it ?",
    packages=setuptools.find_packages(),
    entry_points={
        'console_scripts': [
            'asm2rv=asmv.compile:main',
        ],
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    install_requires=[
        'pyyaml>=5.2', 'markdown>=3.2', 'pdfkit>=0.6.1', 'python-docx>-0.8.10'
    ],
    python_requires='>=3.6',
)
