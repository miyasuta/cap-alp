using { CatalogService } from './cat-service';

//1. Aggregation and analytical annotations
annotate CatalogService.BooksAnalytics with @(
  Aggregation.ApplySupported: {
    Transformations: [
      'aggregate',
      'topcount',
      'bottomcount',
      'identity',
      'concat',
      'groupby',
      'filter',
      'expand',
      'search'      
    ],
    GroupableProperties: [
      ID,
      category1,
      category2,
      title,
      publishedAt
    ],
    AggregatableProperties: [{
      $Type : 'Aggregation.AggregatablePropertyType',
      Property: stock
    }]
  },
  Analytics.AggregatedProperty #totalStock: {
    $Type : 'Analytics.AggregatedPropertyType',
    AggregatableProperty : stock,
    AggregationMethod : 'sum',
    Name : 'totalStock',
    ![@Common.Label]: 'Total stock'
  },
);

//2. Main chart
annotate CatalogService.BooksAnalytics with @(
  UI.Chart: {
    $Type : 'UI.ChartDefinitionType',
    Title: 'Stock',
    ChartType : #Column,
    Dimensions: [
      category1,
      category2
    ],
    DimensionAttributes: [{
      $Type : 'UI.ChartDimensionAttributeType',
      Dimension: category1,
      Role: #Category
    },{
      $Type : 'UI.ChartDimensionAttributeType',
      Dimension: category2,
      Role: #Category2
    }],
    DynamicMeasures: [
      ![@Analytics.AggregatedProperty#totalStock]
    ],
    MeasureAttributes: [{
      $Type: 'UI.ChartMeasureAttributeType',
      DynamicMeasure: ![@Analytics.AggregatedProperty#totalStock],
      Role: #Axis1
    }]
  },
  UI.PresentationVariant: {
    $Type : 'UI.PresentationVariantType',
    Visualizations : [
        '@UI.Chart',
    ],
  }
);

//3. Visual Filters
//category1
annotate CatalogService.BooksAnalytics with @(
  UI.Chart #category1: {
    $Type : 'UI.ChartDefinitionType',
    ChartType: #Bar,
    Dimensions: [
      category1
    ],
    DynamicMeasures: [
      ![@Analytics.AggregatedProperty#totalStock]
    ]
  },
  UI.PresentationVariant #prevCategory1: {
    $Type : 'UI.PresentationVariantType',
    Visualizations : [
        '@UI.Chart#category1',
    ],
  }
){
  category1 @Common.ValueList #vlCategory1: {
    $Type : 'Common.ValueListType',
    CollectionPath : 'BooksAnalytics',
    Parameters: [{
      $Type : 'Common.ValueListParameterInOut',
      ValueListProperty : 'category1',
      LocalDataProperty: category1
    }],
    PresentationVariantQualifier: 'prevCategory1'
  }
}
//category2
annotate CatalogService.BooksAnalytics with @(
  UI.Chart #category2: {
    $Type : 'UI.ChartDefinitionType',
    ChartType: #Bar,
    Dimensions: [
      category2
    ],
    DimensionAttributes: [{
      $Type : 'UI.ChartDimensionAttributeType',
      Dimension: category2,
      Role: #Category
    }],
    DynamicMeasures: [
      ![@Analytics.AggregatedProperty#totalStock]
    ]
  },
  UI.PresentationVariant #prevCategory2: {
    $Type : 'UI.PresentationVariantType',
    Visualizations : [
        '@UI.Chart#category2',
    ],
  }
){
  category2 @Common.ValueList #vlCategory2: {
    $Type : 'Common.ValueListType',
    CollectionPath : 'BooksAnalytics',
    Parameters: [{
      $Type : 'Common.ValueListParameterInOut',
      ValueListProperty : 'category2',
      LocalDataProperty: category2
    }],
    PresentationVariantQualifier: 'prevCategory2'
  }
}
//published at
annotate CatalogService.BooksAnalytics with @(
  UI.Chart #publishedAt: {
    $Type : 'UI.ChartDefinitionType',
    ChartType: #Line,
    Dimensions: [
      publishedAt
    ],
    DimensionAttributes: [{
      $Type : 'UI.ChartDimensionAttributeType',
      Dimension: publishedAt,
      Role: #Category
    }],
    DynamicMeasures: [
      ![@Analytics.AggregatedProperty#totalStock]
    ]
  },
  UI.PresentationVariant #prevPublishedAt: {
    $Type : 'UI.PresentationVariantType',
    Visualizations : [
        '@UI.Chart#publishedAt',
    ],
  }
){
  publishedAt @Common.ValueList #vlPublishedAt: {
    $Type : 'Common.ValueListType',
    CollectionPath : 'BooksAnalytics',
    Parameters: [{
      $Type : 'Common.ValueListParameterInOut',
      ValueListProperty : 'publishedAt',
      LocalDataProperty: publishedAt
    }],
    PresentationVariantQualifier: 'prevPublishedAt'
  }
}

//4. Selection Fields and Line Item
annotate CatalogService.BooksAnalytics with@(
    UI: {
        SelectionFields  : [
            category1,
            category2,
            publishedAt
        ],
        LineItem: [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : category1,
            },
            {
                $Type : 'UI.DataField',
                Value : category2,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Value : publishedAt,
            }
        ],
    }
);