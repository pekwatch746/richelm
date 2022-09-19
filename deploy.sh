#!/bin/bash
set -x

git clone "https://gerrit.o-ran-sc.org/r/ric-plt/ric-dep"

cd ric-dep/bin && ./install_common_templates_to_helm.sh && cat ../RECIPE_EXAMPLE/example_recipe_oran_f_release.yaml | sed -e 's/10\.0\.0\.1//g' > ../RECIPE_EXAMPLE/example_recipe_oran_f_release.yaml.overwrite && cat install | sed -e 's/bash/bash -x/' | sed -e 's/helm install/helm install --debug/' > install2 && chmod +x install2 && ./install2 -f ../RECIPE_EXAMPLE/example_recipe_oran_f_release.yaml.overwrite