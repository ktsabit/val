project('main', 'c', 'vala')

sources = [
    'document.vala',
    'entry.vala',
    'gui.vala',
    'main.vala',
]

deps = [ 
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gee-0.8'),
    dependency('gtk4'),
]

executable('main', sources, dependencies: deps)