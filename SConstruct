import os
import re
import sys

openSCADIncludesRegex = re.compile(r'(?<=(?<=use\s<)).*?(?=\s?\>)')

def OpenSCADIncludes(document):
    '''Parse an OpenSCAD document and return a list of files included'''
    docContents = open(document, 'r').read()
    includeFiles = openSCADIncludesRegex.findall(docContents)
    includesPaths = map(lambda fName: os.path.join(os.path.dirname(document), fName), includeFiles)
    return includesPaths

# Create builders for converting OpenSCAD files into STL and PNG files and for converting Dia files into PNG and SVF files
openScadStlBuilder = Builder(chdir = True, action = '''openscad -o ${TARGET.file} -D 'quality="production"' ${SOURCE.file}''', suffix = '.stl', src_suffix = '.scad')
openScadPngBuilder = Builder(chdir = True, action = '''openscad -o ${TARGET.file} -D 'quality="production"' ${SOURCE.file}''', suffix = '.png', src_suffix = '.scad')
diaPngExportBuilder = Builder(action = 'dia --export=$TARGET $SOURCE', suffix = '.png', src_suffix = '.dia')
diaSvgExportBuilder = Builder(action = 'dia --export=$TARGET $SOURCE', suffix = '.svg', src_suffix = '.dia')

env = Environment(
    ENV = { 'PATH' : os.environ['PATH'] },
    BUILDERS = {
        'OpenScadStl' : openScadStlBuilder,
        'OpenScadPng' : openScadPngBuilder,
        'DiaPngExport' : diaPngExportBuilder,
        'DiaSvgExport' : diaSvgExportBuilder,
    },
)

EXCLUDE_DIRS = ('3rdParty', '_Common', '.git')

EXCLUDE_FILES = ('SortingTray.scad')

for root, dirs, files in os.walk(os.getcwd(), topdown=True):

    # Exclude certain directories from search
    dirs[:] = [d for d in dirs if d not in EXCLUDE_DIRS]

    # Exclude certain files
    files[:] = [f for f in files if f not in EXCLUDE_FILES]

    for fName in files:
        absName = os.path.join(root, fName)
        name, ext = os.path.splitext(fName)
        if ext == '.scad':
            #print 'Adding', absName, 'to OpenSCAD build list'
            includedFiles = OpenSCADIncludes(absName)
            stlTarget = env.OpenScadStl(absName)
            #pngTarget = env.OpenScadPng(absName)
            Depends(stlTarget, includedFiles)
            #Depends(pngTarget, OpenSCADIncludes(absName))
        elif ext == '.dia':
            #print 'Adding', absName, 'to DIA build list'
            env.DiaPngExport(absName)
            env.DiaSvgExport(absName)
