using CatalogService as service from '../../srv/cat-service';
using from '../../srv/cat-service-annotations';

// //category1
// annotate CatalogService.BooksAnalytics with @(
//   UI.Chart #category1: {
//     $Type : 'UI.ChartDefinitionType',
//     ChartType: #Bar,
//     Dimensions: [
//       category1
//     ],
//     DynamicMeasures: [
//       ![@Analytics.AggregatedProperty#totalStock]
//     ]
//   },
//   UI.PresentationVariant #prevCategory1: {
//     $Type : 'UI.PresentationVariantType',
//     Visualizations : [
//         '@UI.Chart#category1',
//     ],
//   }
// ){
//   category1 @Common.ValueList #vlCategory1: {
//     $Type : 'Common.ValueListType',
//     CollectionPath : 'BooksAnalytics',
//     Parameters: [{
//       $Type : 'Common.ValueListParameterInOut',
//       ValueListProperty : 'category1',
//       LocalDataProperty: category1
//     }],
//     PresentationVariantQualifier: 'prevCategory1'
//   }
// }

// // category2
// annotate CatalogService.BooksAnalytics with @(
//   UI.Chart #category2: {
//     $Type : 'UI.ChartDefinitionType',
//     ChartType: #Bar,
//     Dimensions: [
//       category2
//     ],
//     DimensionAttributes: [{
//       $Type : 'UI.ChartDimensionAttributeType',
//       Dimension: category2,
//       Role: #Category
//     }],
//     DynamicMeasures: [
//       ![@Analytics.AggregatedProperty#totalStock]
//     ]
//   },
//   UI.PresentationVariant #prevCategory2: {
//     $Type : 'UI.PresentationVariantType',
//     Visualizations : [
//         '@UI.Chart#category2',
//     ],
//   }
// ){
//   category2 @Common.ValueList #vlCategory2: {
//     $Type : 'Common.ValueListType',
//     CollectionPath : 'BooksAnalytics',
//     Parameters: [{
//       $Type : 'Common.ValueListParameterInOut',
//       ValueListProperty : 'category2',
//       LocalDataProperty: category2
//     }],
//     PresentationVariantQualifier: 'prevCategory2'
//   }
// }
// //published at
// annotate CatalogService.BooksAnalytics with @(
//   UI.Chart #publishedAt: {
//     $Type : 'UI.ChartDefinitionType',
//     ChartType: #Line,
//     Dimensions: [
//       publishedAt
//     ],
//     DimensionAttributes: [{
//       $Type : 'UI.ChartDimensionAttributeType',
//       Dimension: publishedAt,
//       Role: #Category
//     }],
//     DynamicMeasures: [
//       ![@Analytics.AggregatedProperty#totalStock]
//     ]
//   },
//   UI.PresentationVariant #prevPublishedAt: {
//     $Type : 'UI.PresentationVariantType',
//     Visualizations : [
//         '@UI.Chart#publishedAt',
//     ],
//   }
// ){
//   publishedAt @Common.ValueList #vlPublishedAt: {
//     $Type : 'Common.ValueListType',
//     CollectionPath : 'BooksAnalytics',
//     Parameters: [{
//       $Type : 'Common.ValueListParameterInOut',
//       ValueListProperty : 'publishedAt',
//       LocalDataProperty: publishedAt
//     }],
//     PresentationVariantQualifier: 'prevPublishedAt'
//   }
// }

// annotate service.BooksAnalytics with @(
//     UI.Chart #category1 : {
//         $Type : 'UI.ChartDefinitionType',
//         ChartType : #Bar,
//         Dimensions : [
//             category1,
//         ],
//         DynamicMeasures : [
//             '@Analytics.AggregatedProperty#totalStock',
//         ]
//     }
// );
// annotate service.BooksAnalytics with @(
//     UI.PresentationVariant #prevCategory1 : {
//         $Type : 'UI.PresentationVariantType',
//         Visualizations : [
//             '@UI.Chart#category1',
//         ],
//     }
// );
// annotate service.BooksAnalytics with {
//     category1 @Common.ValueList #vlCategory1 : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'BooksAnalytics',
//         PresentationVariantQualifier : 'prevCategory1',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : category1,
//                 ValueListProperty : 'category1',
//             },
//         ],
//     }
// };
