# Language switch fix

The report uses Vietnamese as Hugo's default content language.

Previously, English pages were named `_index.md`. Hugo therefore interpreted them as Vietnamese default-language pages, while `_index.vi.md` was also Vietnamese. This produced duplicate "Tiếng Việt" entries in the language selector.

The English files are now explicitly named `_index.en.md`, while Vietnamese files remain `_index.vi.md`.

Expected URLs:

- Vietnamese: `/quickbite-fcaj-report/2-proposal/`
- English: `/quickbite-fcaj-report/en/2-proposal/`

Run:

```powershell
hugo server -D
```

Then use the language selector to switch between `Tiếng Việt` and `English`.
