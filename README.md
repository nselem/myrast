# myrast
myrast dockerfile 

`docker run -i -t -v /home/nelly/docker-myrast:/home myrast /bin/bash`

Download files
`svr_retrieve_RAST_job <user> <password> <jobId> table_txt > $ID.txt`


### Rast formats to retrieve files.
You can change the format table_txt line 46 Figure 7 for whatever format you need.
genbank            GenBank (with SEED function conventions and enhancements)
genbank_stripped        GenBank with EC-numbers stripped from functions
embl                    EMBL (with SEED function conventions and enhancements)
embl_stripped            EMBL with EC-numbers stripped from functions
gff3                     GFF3
gff3_stripped            GFF3 with EC-numbers stripped from functions
gtf                      GTF
gtf_stripped             GTF with EC-numbers stripped from functions
rast_tarball             gzipped tar archive of the RAST genome directory
nucleic_acid            DNA for genes
amino_acid               Protein translations for genes
table_txt                Gene data in tab-separated format
table_xls                Gene data in EXCEL format

**Example Template**

```html
<md-toolbar class="md-table-toolbar md-default">
  <div class="md-toolbar-tools">
    <span>Nutrition</span>
  </div>
</md-toolbar>

<!-- exact table from live demo -->
<md-table-container>
  <table md-table md-row-select multiple ng-model="selected" md-progress="promise">
    <thead md-head md-order="query.order" md-on-reorder="getDesserts">
      <tr md-row>
        <th md-column md-order-by="nameToLower"><span>Dessert (100g serving)</span></th>
        <th md-column md-numeric md-order-by="calories.value"><span>Calories</span></th>
        <th md-column md-numeric>Fat (g)</th>
        <th md-column md-numeric>Carbs (g)</th>
        <th md-column md-numeric>Protein (g)</th>
        <th md-column md-numeric>Sodium (mg)</th>
        <th md-column md-numeric>Calcium (%)</th>
        <th md-column md-numeric>Iron (%)</th>
      </tr>
    </thead>
    <tbody md-body>
      <tr md-row md-select="dessert" md-select-id="name" md-auto-select ng-repeat="dessert in desserts.data">
        <td md-cell>{{dessert.name}}</td>
        <td md-cell>{{dessert.calories.value}}</td>
        <td md-cell>{{dessert.fat.value | number: 1}}</td>
        <td md-cell>{{dessert.carbs.value}}</td>
        <td md-cell>{{dessert.protein.value | number: 1}}</td>
        <td md-cell>{{dessert.sodium.value}}</td>
        <td md-cell>{{dessert.calcium.value}}{{dessert.calcium.unit}}</td>
        <td md-cell>{{dessert.iron.value}}{{dessert.iron.unit}}</td>
      </tr>
    </tbody>
  </table>
</md-table-container>

<md-table-pagination md-limit="query.limit" md-limit-options="[5, 10, 15]" md-page="query.page" md-total="{{desserts.count}}" md-on-paginate="getDesserts" md-page-select></md-table-pagination>

```
