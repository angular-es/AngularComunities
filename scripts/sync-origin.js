const fs = require('fs');
const path = require('path');
const glob = require('glob');
const { promisify } = require('util');

const copyTargets = [
    'content/cli/**/*.md',
    'content/guide/**/*.md',
    'content/errors/**/*.md',
    'content/marketing/**/*',
    'content/start/**/*.md',
    'content/tutorial/**/*.md',
    'content/navigation.json',
    'content/examples/toh-pt6/src/app/hero-search/hero-search.component.ts',
    'content/examples/toh-pt6/src/app/heroes/heroes.component.html',
    'content/examples/toh-pt6/src/app/hero.service.ts',
    'tools/transforms/templates/lib/githubLinks.html',
    'tools/transforms/templates/error/error.template.html',
];

const promiseGlob = promisify(glob);

async function main() {
    const aioOriginDir = 'origin/aio';
    const aioXDir = 'aio-x';

    const searchFiles = async () => {
        const globResults = await Promise.all(copyTargets.map(target => {
            return promiseGlob(path.resolve(aioOriginDir, target), {});
        }));
        return globResults.reduce((files, result) => [...files, ...(result.map(file => path.relative(aioOriginDir, file)))], []);
    }

    const files = await searchFiles();

    const copy = (file) => {
        const ext = path.extname(file);
        const enFilePath = file.replace(`${ext}`, `.en${ext}`);
        const src = fs.readFileSync(path.resolve(aioOriginDir, file), { encoding: 'utf8' });

        let isTranslated = false;
        try {
            fs.accessSync(path.resolve(aioXDir, enFilePath));
            isTranslated = true;
        } catch (err) { }

        fs.writeFileSync(path.resolve(aioXDir, isTranslated ? enFilePath : file), src, { encoding: 'utf8' });
    };
    files.forEach(copy);
}


main().catch(err => {
    console.error(err);
    process.exit(1);
});

