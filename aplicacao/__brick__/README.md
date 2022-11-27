# {{name.lowerCase().snakeCase()}}

{{description}}

## Tooling

Some submodules were added in order to develop in-house tools (see scripts folder). Pull their source-code by running:

```
git submodule update --init --recursive
```

## App Localizations: How-to

After including new strings on `app_localizations.dart`, go ahead and run the `update_localizations.dart` Dart program. This program will generate the **messages_*** files which contain the string identifier mapped by each locale wording, along with the general `.arb` file.

```bash
dart scripts/update_localizations.dart
```

Once generated, you are ready to generate the general `.tsv` file which your translators can edit and add words for each supported locale:

```
bash scripts/arb_to_tsv.bash
```

After adding the respective missing words, convert the .tsv file back again to .arb:

```
bash scripts/tsv_to_arb.bash
```

### Authors

This template was prepared by:

- Gil Durão, @gildurao
- João Freitas, @freitzzz

Contact us for Flutter freelancing work!