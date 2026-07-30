# Hugo 0.158+ compatibility update

The report was updated for Hugo 0.158 and later:

- Replaced the removed `getJSON` template function with `resources.GetRemote` and `transform.Unmarshal`.
- Replaced `languageName` with `label` in `config.toml`.
- Added `locale` for Vietnamese and English.
- Updated deprecated language template accessors such as `LanguageName`, `Lang`, and `LanguageCode` usages found in the included theme overrides.

Run the site with:

```powershell
hugo server -D
```

Then open:

```text
http://localhost:1313/
```
