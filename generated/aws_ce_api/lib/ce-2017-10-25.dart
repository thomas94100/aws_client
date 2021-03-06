// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'ce-2017-10-25.g.dart';

/// The Cost Explorer API enables you to programmatically query your cost and
/// usage data. You can query for aggregated data such as total monthly costs or
/// total daily usage. You can also query for granular data, such as the number
/// of daily write operations for Amazon DynamoDB database tables in your
/// production environment.
///
/// Service Endpoint
///
/// The Cost Explorer API provides the following endpoint:
///
/// <ul>
/// <li>
/// <code>https://ce.us-east-1.amazonaws.com</code>
/// </li>
/// </ul>
/// For information about costs associated with the Cost Explorer API, see <a
/// href="http://aws.amazon.com/aws-cost-management/pricing/">AWS Cost
/// Management Pricing</a>.
class CostExplorer {
  final _s.JsonProtocol _protocol;
  CostExplorer({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'ce',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a new Cost Category with the requested name and rules.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [rules] :
  /// The Cost Category rules used to categorize costs. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategoryRule.html">CostCategoryRule</a>.
  Future<CreateCostCategoryDefinitionResponse> createCostCategoryDefinition({
    @_s.required String name,
    @_s.required CostCategoryRuleVersion ruleVersion,
    @_s.required List<CostCategoryRule> rules,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^(?! )[\p{L}\p{N}\p{Z}-_]*(?<! )$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(ruleVersion, 'ruleVersion');
    ArgumentError.checkNotNull(rules, 'rules');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.CreateCostCategoryDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'RuleVersion': ruleVersion?.toValue(),
        'Rules': rules,
      },
    );

    return CreateCostCategoryDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a Cost Category. Expenses from this month going forward will no
  /// longer be categorized with this Cost Category.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [costCategoryArn] :
  /// The unique identifier for your Cost Category.
  Future<DeleteCostCategoryDefinitionResponse> deleteCostCategoryDefinition({
    @_s.required String costCategoryArn,
  }) async {
    ArgumentError.checkNotNull(costCategoryArn, 'costCategoryArn');
    _s.validateStringLength(
      'costCategoryArn',
      costCategoryArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'costCategoryArn',
      costCategoryArn,
      r'''arn:aws[-a-z0-9]*:[a-z0-9]+:[-a-z0-9]*:[0-9]{12}:[-a-zA-Z0-9/:_]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.DeleteCostCategoryDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CostCategoryArn': costCategoryArn,
      },
    );

    return DeleteCostCategoryDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Returns the name, ARN, rules, definition, and effective dates of a Cost
  /// Category that's defined in the account.
  ///
  /// You have the option to use <code>EffectiveOn</code> to return a Cost
  /// Category that is active on a specific date. If there is no
  /// <code>EffectiveOn</code> specified, you’ll see a Cost Category that is
  /// effective on the current date. If Cost Category is still effective,
  /// <code>EffectiveEnd</code> is omitted in the response.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [costCategoryArn] :
  /// The unique identifier for your Cost Category.
  ///
  /// Parameter [effectiveOn] :
  /// The date when the Cost Category was effective.
  Future<DescribeCostCategoryDefinitionResponse>
      describeCostCategoryDefinition({
    @_s.required String costCategoryArn,
    String effectiveOn,
  }) async {
    ArgumentError.checkNotNull(costCategoryArn, 'costCategoryArn');
    _s.validateStringLength(
      'costCategoryArn',
      costCategoryArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'costCategoryArn',
      costCategoryArn,
      r'''arn:aws[-a-z0-9]*:[a-z0-9]+:[-a-z0-9]*:[0-9]{12}:[-a-zA-Z0-9/:_]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'effectiveOn',
      effectiveOn,
      20,
      25,
    );
    _s.validateStringPattern(
      'effectiveOn',
      effectiveOn,
      r'''^\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d(([+-]\d\d:\d\d)|Z)$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.DescribeCostCategoryDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CostCategoryArn': costCategoryArn,
        'EffectiveOn': effectiveOn,
      },
    );

    return DescribeCostCategoryDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves cost and usage metrics for your account. You can specify which
  /// cost and usage-related metric, such as <code>BlendedCosts</code> or
  /// <code>UsageQuantity</code>, that you want the request to return. You can
  /// also filter and group your data by various dimensions, such as
  /// <code>SERVICE</code> or <code>AZ</code>, in a specific time range. For a
  /// complete list of valid dimensions, see the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html">GetDimensionValues</a>
  /// operation. Master accounts in an organization in AWS Organizations have
  /// access to all member accounts.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BillExpirationException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  /// May throw [RequestChangedException].
  ///
  /// Parameter [timePeriod] :
  /// Sets the start and end dates for retrieving AWS costs. The start date is
  /// inclusive, but the end date is exclusive. For example, if
  /// <code>start</code> is <code>2017-01-01</code> and <code>end</code> is
  /// <code>2017-05-01</code>, then the cost and usage data is retrieved from
  /// <code>2017-01-01</code> up to and including <code>2017-04-30</code> but
  /// not including <code>2017-05-01</code>.
  ///
  /// Parameter [filter] :
  /// Filters AWS costs by different dimensions. For example, you can specify
  /// <code>SERVICE</code> and <code>LINKED_ACCOUNT</code> and get the costs
  /// that are associated with that account's usage of that service. You can
  /// nest <code>Expression</code> objects to define any combination of
  /// dimension filters. For more information, see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>.
  ///
  /// Parameter [granularity] :
  /// Sets the AWS cost granularity to <code>MONTHLY</code> or
  /// <code>DAILY</code>, or <code>HOURLY</code>. If <code>Granularity</code>
  /// isn't set, the response object doesn't include the
  /// <code>Granularity</code>, either <code>MONTHLY</code> or
  /// <code>DAILY</code>, or <code>HOURLY</code>.
  ///
  /// Parameter [groupBy] :
  /// You can group AWS costs using up to two different groups, either
  /// dimensions, tag keys, or both.
  ///
  /// When you group by tag key, you get all tag values, including empty
  /// strings.
  ///
  /// Valid values are <code>AZ</code>, <code>INSTANCE_TYPE</code>,
  /// <code>LEGAL_ENTITY_NAME</code>, <code>LINKED_ACCOUNT</code>,
  /// <code>OPERATION</code>, <code>PLATFORM</code>, <code>PURCHASE_TYPE</code>,
  /// <code>SERVICE</code>, <code>TAGS</code>, <code>TENANCY</code>,
  /// <code>RECORD_TYPE</code>, and <code>USAGE_TYPE</code>.
  ///
  /// Parameter [metrics] :
  /// Which metrics are returned in the query. For more information about
  /// blended and unblended rates, see <a
  /// href="http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/">Why
  /// does the "blended" annotation appear on some line items in my bill?</a>.
  ///
  /// Valid values are <code>AmortizedCost</code>, <code>BlendedCost</code>,
  /// <code>NetAmortizedCost</code>, <code>NetUnblendedCost</code>,
  /// <code>NormalizedUsageAmount</code>, <code>UnblendedCost</code>, and
  /// <code>UsageQuantity</code>.
  /// <note>
  /// If you return the <code>UsageQuantity</code> metric, the service
  /// aggregates all usage numbers without taking into account the units. For
  /// example, if you aggregate <code>usageQuantity</code> across all of Amazon
  /// EC2, the results aren't meaningful because Amazon EC2 compute hours and
  /// data transfer are measured in different units (for example, hours vs. GB).
  /// To get more meaningful <code>UsageQuantity</code> metrics, filter by
  /// <code>UsageType</code> or <code>UsageTypeGroups</code>.
  /// </note>
  /// <code>Metrics</code> is required for <code>GetCostAndUsage</code>
  /// requests.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. AWS provides the token when
  /// the response from a previous call has more results than the maximum page
  /// size.
  Future<GetCostAndUsageResponse> getCostAndUsage({
    @_s.required DateInterval timePeriod,
    Expression filter,
    Granularity granularity,
    List<GroupDefinition> groupBy,
    List<String> metrics,
    String nextPageToken,
  }) async {
    ArgumentError.checkNotNull(timePeriod, 'timePeriod');
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextPageToken',
      nextPageToken,
      r'''[\S\s]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetCostAndUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        'Filter': filter,
        'Granularity': granularity?.toValue(),
        'GroupBy': groupBy,
        'Metrics': metrics,
        'NextPageToken': nextPageToken,
      },
    );

    return GetCostAndUsageResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves cost and usage metrics with resources for your account. You can
  /// specify which cost and usage-related metric, such as
  /// <code>BlendedCosts</code> or <code>UsageQuantity</code>, that you want the
  /// request to return. You can also filter and group your data by various
  /// dimensions, such as <code>SERVICE</code> or <code>AZ</code>, in a specific
  /// time range. For a complete list of valid dimensions, see the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetDimensionValues.html">GetDimensionValues</a>
  /// operation. Master accounts in an organization in AWS Organizations have
  /// access to all member accounts. This API is currently available for the
  /// Amazon Elastic Compute Cloud – Compute service only.
  /// <note>
  /// This is an opt-in only feature. You can enable this feature from the Cost
  /// Explorer Settings page. For information on how to access the Settings
  /// page, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-access.html">Controlling
  /// Access for Cost Explorer</a> in the <i>AWS Billing and Cost Management
  /// User Guide</i>.
  /// </note>
  ///
  /// May throw [DataUnavailableException].
  /// May throw [LimitExceededException].
  /// May throw [BillExpirationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [RequestChangedException].
  ///
  /// Parameter [timePeriod] :
  /// Sets the start and end dates for retrieving Amazon Web Services costs. The
  /// range must be within the last 14 days (the start date cannot be earlier
  /// than 14 days ago). The start date is inclusive, but the end date is
  /// exclusive. For example, if <code>start</code> is <code>2017-01-01</code>
  /// and <code>end</code> is <code>2017-05-01</code>, then the cost and usage
  /// data is retrieved from <code>2017-01-01</code> up to and including
  /// <code>2017-04-30</code> but not including <code>2017-05-01</code>.
  ///
  /// Parameter [filter] :
  /// Filters Amazon Web Services costs by different dimensions. For example,
  /// you can specify <code>SERVICE</code> and <code>LINKED_ACCOUNT</code> and
  /// get the costs that are associated with that account's usage of that
  /// service. You can nest <code>Expression</code> objects to define any
  /// combination of dimension filters. For more information, see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>.
  ///
  /// The <code>GetCostAndUsageWithResources</code> operation requires that you
  /// either group by or filter by a <code>ResourceId</code>.
  ///
  /// Parameter [granularity] :
  /// Sets the AWS cost granularity to <code>MONTHLY</code>, <code>DAILY</code>,
  /// or <code>HOURLY</code>. If <code>Granularity</code> isn't set, the
  /// response object doesn't include the <code>Granularity</code>,
  /// <code>MONTHLY</code>, <code>DAILY</code>, or <code>HOURLY</code>.
  ///
  /// Parameter [groupBy] :
  /// You can group Amazon Web Services costs using up to two different groups:
  /// either dimensions, tag keys, or both.
  ///
  /// Parameter [metrics] :
  /// Which metrics are returned in the query. For more information about
  /// blended and unblended rates, see <a
  /// href="http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/">Why
  /// does the "blended" annotation appear on some line items in my bill?</a>.
  ///
  /// Valid values are <code>AmortizedCost</code>, <code>BlendedCost</code>,
  /// <code>NetAmortizedCost</code>, <code>NetUnblendedCost</code>,
  /// <code>NormalizedUsageAmount</code>, <code>UnblendedCost</code>, and
  /// <code>UsageQuantity</code>.
  /// <note>
  /// If you return the <code>UsageQuantity</code> metric, the service
  /// aggregates all usage numbers without taking the units into account. For
  /// example, if you aggregate <code>usageQuantity</code> across all of Amazon
  /// EC2, the results aren't meaningful because Amazon EC2 compute hours and
  /// data transfer are measured in different units (for example, hours vs. GB).
  /// To get more meaningful <code>UsageQuantity</code> metrics, filter by
  /// <code>UsageType</code> or <code>UsageTypeGroups</code>.
  /// </note>
  /// <code>Metrics</code> is required for
  /// <code>GetCostAndUsageWithResources</code> requests.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. AWS provides the token when
  /// the response from a previous call has more results than the maximum page
  /// size.
  Future<GetCostAndUsageWithResourcesResponse> getCostAndUsageWithResources({
    @_s.required DateInterval timePeriod,
    Expression filter,
    Granularity granularity,
    List<GroupDefinition> groupBy,
    List<String> metrics,
    String nextPageToken,
  }) async {
    ArgumentError.checkNotNull(timePeriod, 'timePeriod');
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextPageToken',
      nextPageToken,
      r'''[\S\s]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetCostAndUsageWithResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        'Filter': filter,
        'Granularity': granularity?.toValue(),
        'GroupBy': groupBy,
        'Metrics': metrics,
        'NextPageToken': nextPageToken,
      },
    );

    return GetCostAndUsageWithResourcesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a forecast for how much Amazon Web Services predicts that you
  /// will spend over the forecast time period that you select, based on your
  /// past costs.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [granularity] :
  /// How granular you want the forecast to be. You can get 3 months of
  /// <code>DAILY</code> forecasts or 12 months of <code>MONTHLY</code>
  /// forecasts.
  ///
  /// The <code>GetCostForecast</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  ///
  /// Parameter [metric] :
  /// Which metric Cost Explorer uses to create your forecast. For more
  /// information about blended and unblended rates, see <a
  /// href="http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/">Why
  /// does the "blended" annotation appear on some line items in my bill?</a>.
  ///
  /// Valid values for a <code>GetCostForecast</code> call are the following:
  ///
  /// <ul>
  /// <li>
  /// AMORTIZED_COST
  /// </li>
  /// <li>
  /// BLENDED_COST
  /// </li>
  /// <li>
  /// NET_AMORTIZED_COST
  /// </li>
  /// <li>
  /// NET_UNBLENDED_COST
  /// </li>
  /// <li>
  /// UNBLENDED_COST
  /// </li>
  /// </ul>
  ///
  /// Parameter [timePeriod] :
  /// The period of time that you want the forecast to cover.
  ///
  /// Parameter [filter] :
  /// The filters that you want to use to filter your forecast. Cost Explorer
  /// API supports all of the Cost Explorer filters.
  ///
  /// Parameter [predictionIntervalLevel] :
  /// Cost Explorer always returns the mean forecast as a single point. You can
  /// request a prediction interval around the mean by specifying a confidence
  /// level. The higher the confidence level, the more confident Cost Explorer
  /// is about the actual value falling in the prediction interval. Higher
  /// confidence levels result in wider prediction intervals.
  Future<GetCostForecastResponse> getCostForecast({
    @_s.required Granularity granularity,
    @_s.required Metric metric,
    @_s.required DateInterval timePeriod,
    Expression filter,
    int predictionIntervalLevel,
  }) async {
    ArgumentError.checkNotNull(granularity, 'granularity');
    ArgumentError.checkNotNull(metric, 'metric');
    ArgumentError.checkNotNull(timePeriod, 'timePeriod');
    _s.validateNumRange(
      'predictionIntervalLevel',
      predictionIntervalLevel,
      51,
      99,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetCostForecast'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Granularity': granularity?.toValue(),
        'Metric': metric?.toValue(),
        'TimePeriod': timePeriod,
        'Filter': filter,
        'PredictionIntervalLevel': predictionIntervalLevel,
      },
    );

    return GetCostForecastResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves all available filter values for a specified filter over a period
  /// of time. You can search the dimension values for an arbitrary string.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BillExpirationException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  /// May throw [RequestChangedException].
  ///
  /// Parameter [dimension] :
  /// The name of the dimension. Each <code>Dimension</code> is available for a
  /// different <code>Context</code>. For more information, see
  /// <code>Context</code>.
  ///
  /// Parameter [timePeriod] :
  /// The start and end dates for retrieving the dimension values. The start
  /// date is inclusive, but the end date is exclusive. For example, if
  /// <code>start</code> is <code>2017-01-01</code> and <code>end</code> is
  /// <code>2017-05-01</code>, then the cost and usage data is retrieved from
  /// <code>2017-01-01</code> up to and including <code>2017-04-30</code> but
  /// not including <code>2017-05-01</code>.
  ///
  /// Parameter [context] :
  /// The context for the call to <code>GetDimensionValues</code>. This can be
  /// <code>RESERVATIONS</code> or <code>COST_AND_USAGE</code>. The default
  /// value is <code>COST_AND_USAGE</code>. If the context is set to
  /// <code>RESERVATIONS</code>, the resulting dimension values can be used in
  /// the <code>GetReservationUtilization</code> operation. If the context is
  /// set to <code>COST_AND_USAGE</code>, the resulting dimension values can be
  /// used in the <code>GetCostAndUsage</code> operation.
  ///
  /// If you set the context to <code>COST_AND_USAGE</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// AZ - The Availability Zone. An example is <code>us-east-1a</code>.
  /// </li>
  /// <li>
  /// DATABASE_ENGINE - The Amazon Relational Database Service database.
  /// Examples are Aurora or MySQL.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// <code>m4.xlarge</code>.
  /// </li>
  /// <li>
  /// LEGAL_ENTITY_NAME - The name of the organization that sells you AWS
  /// services, such as Amazon Web Services.
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the
  /// full name of the member account. The value field contains the AWS ID of
  /// the member account.
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM - The operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// OPERATION - The action performed. Examples include
  /// <code>RunInstance</code> and <code>CreateBucket</code>.
  /// </li>
  /// <li>
  /// PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// PURCHASE_TYPE - The reservation type of the purchase to which this usage
  /// is related. Examples include On-Demand Instances and Standard Reserved
  /// Instances.
  /// </li>
  /// <li>
  /// SERVICE - The AWS service such as Amazon DynamoDB.
  /// </li>
  /// <li>
  /// USAGE_TYPE - The type of usage. An example is DataTransfer-In-Bytes. The
  /// response for the <code>GetDimensionValues</code> operation includes a unit
  /// attribute. Examples include GB and Hrs.
  /// </li>
  /// <li>
  /// USAGE_TYPE_GROUP - The grouping of common usage types. An example is
  /// Amazon EC2: CloudWatch – Alarms. The response for this operation includes
  /// a unit attribute.
  /// </li>
  /// <li>
  /// RECORD_TYPE - The different types of charges such as RI fees, usage costs,
  /// tax refunds, and credits.
  /// </li>
  /// <li>
  /// RESOURCE_ID - The unique identifier of the resource. ResourceId is an
  /// opt-in feature only available for last 14 days for EC2-Compute Service.
  /// </li>
  /// </ul>
  /// If you set the context to <code>RESERVATIONS</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// AZ - The Availability Zone. An example is <code>us-east-1a</code>.
  /// </li>
  /// <li>
  /// CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are
  /// Windows or Linux.
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service
  /// deployments. Valid values are <code>SingleAZ</code> and
  /// <code>MultiAZ</code>.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// <code>m4.xlarge</code>.
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the
  /// full name of the member account. The value field contains the AWS ID of
  /// the member account.
  /// </li>
  /// <li>
  /// PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// REGION - The AWS Region.
  /// </li>
  /// <li>
  /// SCOPE (Utilization only) - The scope of a Reserved Instance (RI). Values
  /// are regional or a single Availability Zone.
  /// </li>
  /// <li>
  /// TAG (Coverage only) - The tags that are associated with a Reserved
  /// Instance (RI).
  /// </li>
  /// <li>
  /// TENANCY - The tenancy of a resource. Examples are shared or dedicated.
  /// </li>
  /// </ul>
  /// If you set the context to <code>SAVINGS_PLANS</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or Compute)
  /// </li>
  /// <li>
  /// PAYMENT_OPTION - Payment option for the given Savings Plans (for example,
  /// All Upfront)
  /// </li>
  /// <li>
  /// REGION - The AWS Region.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE_FAMILY - The family of instances (For example,
  /// <code>m5</code>)
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the
  /// full name of the member account. The value field contains the AWS ID of
  /// the member account.
  /// </li>
  /// <li>
  /// SAVINGS_PLAN_ARN - The unique identifier for your Savings Plan
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. AWS provides the token when
  /// the response from a previous call has more results than the maximum page
  /// size.
  ///
  /// Parameter [searchString] :
  /// The value that you want to search the filter values for.
  Future<GetDimensionValuesResponse> getDimensionValues({
    @_s.required Dimension dimension,
    @_s.required DateInterval timePeriod,
    Context context,
    String nextPageToken,
    String searchString,
  }) async {
    ArgumentError.checkNotNull(dimension, 'dimension');
    ArgumentError.checkNotNull(timePeriod, 'timePeriod');
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextPageToken',
      nextPageToken,
      r'''[\S\s]*''',
    );
    _s.validateStringLength(
      'searchString',
      searchString,
      0,
      1024,
    );
    _s.validateStringPattern(
      'searchString',
      searchString,
      r'''[\S\s]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetDimensionValues'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Dimension': dimension?.toValue(),
        'TimePeriod': timePeriod,
        'Context': context?.toValue(),
        'NextPageToken': nextPageToken,
        'SearchString': searchString,
      },
    );

    return GetDimensionValuesResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the reservation coverage for your account. This enables you to
  /// see how much of your Amazon Elastic Compute Cloud, Amazon ElastiCache,
  /// Amazon Relational Database Service, or Amazon Redshift usage is covered by
  /// a reservation. An organization's master account can see the coverage of
  /// the associated member accounts. This supports dimensions, Cost Categories,
  /// and nested expressions. For any time period, you can filter data about
  /// reservation usage by the following dimensions:
  ///
  /// <ul>
  /// <li>
  /// AZ
  /// </li>
  /// <li>
  /// CACHE_ENGINE
  /// </li>
  /// <li>
  /// DATABASE_ENGINE
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION
  /// </li>
  /// <li>
  /// INSTANCE_TYPE
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM
  /// </li>
  /// <li>
  /// PLATFORM
  /// </li>
  /// <li>
  /// REGION
  /// </li>
  /// <li>
  /// SERVICE
  /// </li>
  /// <li>
  /// TAG
  /// </li>
  /// <li>
  /// TENANCY
  /// </li>
  /// </ul>
  /// To determine valid values for a dimension, use the
  /// <code>GetDimensionValues</code> operation.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [timePeriod] :
  /// The start and end dates of the period that you want to retrieve data about
  /// reservation coverage for. You can retrieve data for a maximum of 13
  /// months: the last 12 months and the current month. The start date is
  /// inclusive, but the end date is exclusive. For example, if
  /// <code>start</code> is <code>2017-01-01</code> and <code>end</code> is
  /// <code>2017-05-01</code>, then the cost and usage data is retrieved from
  /// <code>2017-01-01</code> up to and including <code>2017-04-30</code> but
  /// not including <code>2017-05-01</code>.
  ///
  /// Parameter [filter] :
  /// Filters utilization data by dimensions. You can filter by the following
  /// dimensions:
  ///
  /// <ul>
  /// <li>
  /// AZ
  /// </li>
  /// <li>
  /// CACHE_ENGINE
  /// </li>
  /// <li>
  /// DATABASE_ENGINE
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION
  /// </li>
  /// <li>
  /// INSTANCE_TYPE
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM
  /// </li>
  /// <li>
  /// PLATFORM
  /// </li>
  /// <li>
  /// REGION
  /// </li>
  /// <li>
  /// SERVICE
  /// </li>
  /// <li>
  /// TAG
  /// </li>
  /// <li>
  /// TENANCY
  /// </li>
  /// </ul>
  /// <code>GetReservationCoverage</code> uses the same <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object as the other operations, but only <code>AND</code> is supported
  /// among each dimension. You can nest only one level deep. If there are
  /// multiple values for a dimension, they are OR'd together.
  ///
  /// If you don't provide a <code>SERVICE</code> filter, Cost Explorer defaults
  /// to EC2.
  ///
  /// Cost category is also supported.
  ///
  /// Parameter [granularity] :
  /// The granularity of the AWS cost data for the reservation. Valid values are
  /// <code>MONTHLY</code> and <code>DAILY</code>.
  ///
  /// If <code>GroupBy</code> is set, <code>Granularity</code> can't be set. If
  /// <code>Granularity</code> isn't set, the response object doesn't include
  /// <code>Granularity</code>, either <code>MONTHLY</code> or
  /// <code>DAILY</code>.
  ///
  /// The <code>GetReservationCoverage</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  ///
  /// Parameter [groupBy] :
  /// You can group the data by the following attributes:
  ///
  /// <ul>
  /// <li>
  /// AZ
  /// </li>
  /// <li>
  /// CACHE_ENGINE
  /// </li>
  /// <li>
  /// DATABASE_ENGINE
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION
  /// </li>
  /// <li>
  /// INSTANCE_TYPE
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM
  /// </li>
  /// <li>
  /// PLATFORM
  /// </li>
  /// <li>
  /// REGION
  /// </li>
  /// <li>
  /// TENANCY
  /// </li>
  /// </ul>
  ///
  /// Parameter [metrics] :
  /// The measurement that you want your reservation coverage reported in.
  ///
  /// Valid values are <code>Hour</code>, <code>Unit</code>, and
  /// <code>Cost</code>. You can use multiple values in a request.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. AWS provides the token when
  /// the response from a previous call has more results than the maximum page
  /// size.
  Future<GetReservationCoverageResponse> getReservationCoverage({
    @_s.required DateInterval timePeriod,
    Expression filter,
    Granularity granularity,
    List<GroupDefinition> groupBy,
    List<String> metrics,
    String nextPageToken,
  }) async {
    ArgumentError.checkNotNull(timePeriod, 'timePeriod');
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextPageToken',
      nextPageToken,
      r'''[\S\s]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetReservationCoverage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        'Filter': filter,
        'Granularity': granularity?.toValue(),
        'GroupBy': groupBy,
        'Metrics': metrics,
        'NextPageToken': nextPageToken,
      },
    );

    return GetReservationCoverageResponse.fromJson(jsonResponse.body);
  }

  /// Gets recommendations for which reservations to purchase. These
  /// recommendations could help you reduce your costs. Reservations provide a
  /// discounted hourly rate (up to 75%) compared to On-Demand pricing.
  ///
  /// AWS generates your recommendations by identifying your On-Demand usage
  /// during a specific time period and collecting your usage into categories
  /// that are eligible for a reservation. After AWS has these categories, it
  /// simulates every combination of reservations in each category of usage to
  /// identify the best number of each type of RI to purchase to maximize your
  /// estimated savings.
  ///
  /// For example, AWS automatically aggregates your Amazon EC2 Linux, shared
  /// tenancy, and c4 family usage in the US West (Oregon) Region and recommends
  /// that you buy size-flexible regional reservations to apply to the c4 family
  /// usage. AWS recommends the smallest size instance in an instance family.
  /// This makes it easier to purchase a size-flexible RI. AWS also shows the
  /// equal number of normalized units so that you can purchase any instance
  /// size that you want. For this example, your RI recommendation would be for
  /// <code>c4.large</code> because that is the smallest size instance in the c4
  /// instance family.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [service] :
  /// The specific service that you want recommendations for.
  ///
  /// Parameter [accountId] :
  /// The account ID that is associated with the recommendation.
  ///
  /// Parameter [accountScope] :
  /// The account scope that you want your recommendations for. Amazon Web
  /// Services calculates recommendations including the payer account and linked
  /// accounts if the value is set to <code>PAYER</code>. If the value is
  /// <code>LINKED</code>, recommendations are calculated for individual linked
  /// accounts only.
  ///
  /// Parameter [lookbackPeriodInDays] :
  /// The number of previous days that you want AWS to consider when it
  /// calculates your recommendations.
  ///
  /// Parameter [nextPageToken] :
  /// The pagination token that indicates the next set of results that you want
  /// to retrieve.
  ///
  /// Parameter [pageSize] :
  /// The number of recommendations that you want returned in a single response
  /// object.
  ///
  /// Parameter [paymentOption] :
  /// The reservation purchase option that you want recommendations for.
  ///
  /// Parameter [serviceSpecification] :
  /// The hardware specifications for the service instances that you want
  /// recommendations for, such as standard or convertible Amazon EC2 instances.
  ///
  /// Parameter [termInYears] :
  /// The reservation term that you want recommendations for.
  Future<GetReservationPurchaseRecommendationResponse>
      getReservationPurchaseRecommendation({
    @_s.required String service,
    String accountId,
    AccountScope accountScope,
    LookbackPeriodInDays lookbackPeriodInDays,
    String nextPageToken,
    int pageSize,
    PaymentOption paymentOption,
    ServiceSpecification serviceSpecification,
    TermInYears termInYears,
  }) async {
    ArgumentError.checkNotNull(service, 'service');
    _s.validateStringLength(
      'service',
      service,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'service',
      service,
      r'''[\S\s]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      1024,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''[\S\s]*''',
    );
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextPageToken',
      nextPageToken,
      r'''[\S\s]*''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSInsightsIndexService.GetReservationPurchaseRecommendation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Service': service,
        'AccountId': accountId,
        'AccountScope': accountScope?.toValue(),
        'LookbackPeriodInDays': lookbackPeriodInDays?.toValue(),
        'NextPageToken': nextPageToken,
        'PageSize': pageSize,
        'PaymentOption': paymentOption?.toValue(),
        'ServiceSpecification': serviceSpecification,
        'TermInYears': termInYears?.toValue(),
      },
    );

    return GetReservationPurchaseRecommendationResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the reservation utilization for your account. Master accounts in
  /// an organization have access to member accounts. You can filter data by
  /// dimensions in a time period. You can use <code>GetDimensionValues</code>
  /// to determine the possible dimension values. Currently, you can group only
  /// by <code>SUBSCRIPTION_ID</code>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [timePeriod] :
  /// Sets the start and end dates for retrieving RI utilization. The start date
  /// is inclusive, but the end date is exclusive. For example, if
  /// <code>start</code> is <code>2017-01-01</code> and <code>end</code> is
  /// <code>2017-05-01</code>, then the cost and usage data is retrieved from
  /// <code>2017-01-01</code> up to and including <code>2017-04-30</code> but
  /// not including <code>2017-05-01</code>.
  ///
  /// Parameter [filter] :
  /// Filters utilization data by dimensions. You can filter by the following
  /// dimensions:
  ///
  /// <ul>
  /// <li>
  /// AZ
  /// </li>
  /// <li>
  /// CACHE_ENGINE
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION
  /// </li>
  /// <li>
  /// INSTANCE_TYPE
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM
  /// </li>
  /// <li>
  /// PLATFORM
  /// </li>
  /// <li>
  /// REGION
  /// </li>
  /// <li>
  /// SERVICE
  /// </li>
  /// <li>
  /// SCOPE
  /// </li>
  /// <li>
  /// TENANCY
  /// </li>
  /// </ul>
  /// <code>GetReservationUtilization</code> uses the same <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object as the other operations, but only <code>AND</code> is supported
  /// among each dimension, and nesting is supported up to only one level deep.
  /// If there are multiple values for a dimension, they are OR'd together.
  ///
  /// Parameter [granularity] :
  /// If <code>GroupBy</code> is set, <code>Granularity</code> can't be set. If
  /// <code>Granularity</code> isn't set, the response object doesn't include
  /// <code>Granularity</code>, either <code>MONTHLY</code> or
  /// <code>DAILY</code>. If both <code>GroupBy</code> and
  /// <code>Granularity</code> aren't set,
  /// <code>GetReservationUtilization</code> defaults to <code>DAILY</code>.
  ///
  /// The <code>GetReservationUtilization</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  ///
  /// Parameter [groupBy] :
  /// Groups only by <code>SUBSCRIPTION_ID</code>. Metadata is included.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. AWS provides the token when
  /// the response from a previous call has more results than the maximum page
  /// size.
  Future<GetReservationUtilizationResponse> getReservationUtilization({
    @_s.required DateInterval timePeriod,
    Expression filter,
    Granularity granularity,
    List<GroupDefinition> groupBy,
    String nextPageToken,
  }) async {
    ArgumentError.checkNotNull(timePeriod, 'timePeriod');
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextPageToken',
      nextPageToken,
      r'''[\S\s]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetReservationUtilization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        'Filter': filter,
        'Granularity': granularity?.toValue(),
        'GroupBy': groupBy,
        'NextPageToken': nextPageToken,
      },
    );

    return GetReservationUtilizationResponse.fromJson(jsonResponse.body);
  }

  /// Creates recommendations that helps you save cost by identifying idle and
  /// underutilized Amazon EC2 instances.
  ///
  /// Recommendations are generated to either downsize or terminate instances,
  /// along with providing savings detail and metrics. For details on
  /// calculation and function, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-what-is.html">Optimizing
  /// Your Cost with Rightsizing Recommendations</a>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [service] :
  /// The specific service that you want recommendations for. The only valid
  /// value for <code>GetRightsizingRecommendation</code> is
  /// "<code>AmazonEC2</code>".
  ///
  /// Parameter [nextPageToken] :
  /// The pagination token that indicates the next set of results that you want
  /// to retrieve.
  ///
  /// Parameter [pageSize] :
  /// The number of recommendations that you want returned in a single response
  /// object.
  Future<GetRightsizingRecommendationResponse> getRightsizingRecommendation({
    @_s.required String service,
    Expression filter,
    String nextPageToken,
    int pageSize,
  }) async {
    ArgumentError.checkNotNull(service, 'service');
    _s.validateStringLength(
      'service',
      service,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'service',
      service,
      r'''[\S\s]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextPageToken',
      nextPageToken,
      r'''[\S\s]*''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetRightsizingRecommendation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Service': service,
        'Filter': filter,
        'NextPageToken': nextPageToken,
        'PageSize': pageSize,
      },
    );

    return GetRightsizingRecommendationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the Savings Plans covered for your account. This enables you to
  /// see how much of your cost is covered by a Savings Plan. An organization’s
  /// master account can see the coverage of the associated member accounts.
  /// This supports dimensions, Cost Categories, and nested expressions. For any
  /// time period, you can filter data for Savings Plans usage with the
  /// following dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>LINKED_ACCOUNT</code>
  /// </li>
  /// <li>
  /// <code>REGION</code>
  /// </li>
  /// <li>
  /// <code>SERVICE</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_FAMILY</code>
  /// </li>
  /// </ul>
  /// To determine valid values for a dimension, use the
  /// <code>GetDimensionValues</code> operation.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [timePeriod] :
  /// The time period that you want the usage and costs for. The
  /// <code>Start</code> date must be within 13 months. The <code>End</code>
  /// date must be after the <code>Start</code> date, and before the current
  /// date. Future dates can't be used as an <code>End</code> date.
  ///
  /// Parameter [filter] :
  /// Filters Savings Plans coverage data by dimensions. You can filter data for
  /// Savings Plans usage with the following dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>LINKED_ACCOUNT</code>
  /// </li>
  /// <li>
  /// <code>REGION</code>
  /// </li>
  /// <li>
  /// <code>SERVICE</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_FAMILY</code>
  /// </li>
  /// </ul>
  /// <code>GetSavingsPlansCoverage</code> uses the same <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object as the other operations, but only <code>AND</code> is supported
  /// among each dimension. If there are multiple values for a dimension, they
  /// are OR'd together.
  ///
  /// Cost category is also supported.
  ///
  /// Parameter [granularity] :
  /// The granularity of the Amazon Web Services cost data for your Savings
  /// Plans. <code>Granularity</code> can't be set if <code>GroupBy</code> is
  /// set.
  ///
  /// The <code>GetSavingsPlansCoverage</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  ///
  /// Parameter [groupBy] :
  /// You can group the data using the attributes <code>INSTANCE_FAMILY</code>,
  /// <code>REGION</code>, or <code>SERVICE</code>.
  ///
  /// Parameter [maxResults] :
  /// The number of items to be returned in a response. The default is
  /// <code>20</code>, with a minimum value of <code>1</code>.
  ///
  /// Parameter [metrics] :
  /// The measurement that you want your Savings Plans coverage reported in. The
  /// only valid value is <code>SpendCoveredBySavingsPlans</code>.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<GetSavingsPlansCoverageResponse> getSavingsPlansCoverage({
    @_s.required DateInterval timePeriod,
    Expression filter,
    Granularity granularity,
    List<GroupDefinition> groupBy,
    int maxResults,
    List<String> metrics,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(timePeriod, 'timePeriod');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S\s]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetSavingsPlansCoverage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        'Filter': filter,
        'Granularity': granularity?.toValue(),
        'GroupBy': groupBy,
        'MaxResults': maxResults,
        'Metrics': metrics,
        'NextToken': nextToken,
      },
    );

    return GetSavingsPlansCoverageResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves your request parameters, Savings Plan Recommendations Summary
  /// and Details.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [lookbackPeriodInDays] :
  /// The lookback period used to generate the recommendation.
  ///
  /// Parameter [paymentOption] :
  /// The payment option used to generate these recommendations.
  ///
  /// Parameter [savingsPlansType] :
  /// The Savings Plans recommendation type requested.
  ///
  /// Parameter [termInYears] :
  /// The savings plan recommendation term used to generated these
  /// recommendations.
  ///
  /// Parameter [accountScope] :
  /// The account scope that you want your recommendations for. Amazon Web
  /// Services calculates recommendations including the payer account and linked
  /// accounts if the value is set to <code>PAYER</code>. If the value is
  /// <code>LINKED</code>, recommendations are calculated for individual linked
  /// accounts only.
  ///
  /// Parameter [filter] :
  /// You can filter your recommendations by Account ID with the
  /// <code>LINKED_ACCOUNT</code> dimension. To filter your recommendations by
  /// Account ID, specify <code>Key</code> as <code>LINKED_ACCOUNT</code> and
  /// <code>Value</code> as the comma-separated Acount ID(s) for which you want
  /// to see Savings Plans purchase recommendations.
  ///
  /// For GetSavingsPlansPurchaseRecommendation, the <code>Filter</code> does
  /// not include <code>CostCategories</code> or <code>Tags</code>. It only
  /// includes <code>Dimensions</code>. With <code>Dimensions</code>,
  /// <code>Key</code> must be <code>LINKED_ACCOUNT</code> and
  /// <code>Value</code> can be a single Account ID or multiple comma-separated
  /// Account IDs for which you want to see Savings Plans Purchase
  /// Recommendations. <code>AND</code> and <code>OR</code> operators are not
  /// supported.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  ///
  /// Parameter [pageSize] :
  /// The number of recommendations that you want returned in a single response
  /// object.
  Future<GetSavingsPlansPurchaseRecommendationResponse>
      getSavingsPlansPurchaseRecommendation({
    @_s.required LookbackPeriodInDays lookbackPeriodInDays,
    @_s.required PaymentOption paymentOption,
    @_s.required SupportedSavingsPlansType savingsPlansType,
    @_s.required TermInYears termInYears,
    AccountScope accountScope,
    Expression filter,
    String nextPageToken,
    int pageSize,
  }) async {
    ArgumentError.checkNotNull(lookbackPeriodInDays, 'lookbackPeriodInDays');
    ArgumentError.checkNotNull(paymentOption, 'paymentOption');
    ArgumentError.checkNotNull(savingsPlansType, 'savingsPlansType');
    ArgumentError.checkNotNull(termInYears, 'termInYears');
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextPageToken',
      nextPageToken,
      r'''[\S\s]*''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      0,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSInsightsIndexService.GetSavingsPlansPurchaseRecommendation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LookbackPeriodInDays': lookbackPeriodInDays?.toValue(),
        'PaymentOption': paymentOption?.toValue(),
        'SavingsPlansType': savingsPlansType?.toValue(),
        'TermInYears': termInYears?.toValue(),
        'AccountScope': accountScope?.toValue(),
        'Filter': filter,
        'NextPageToken': nextPageToken,
        'PageSize': pageSize,
      },
    );

    return GetSavingsPlansPurchaseRecommendationResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the Savings Plans utilization for your account across date
  /// ranges with daily or monthly granularity. Master accounts in an
  /// organization have access to member accounts. You can use
  /// <code>GetDimensionValues</code> in <code>SAVINGS_PLANS</code> to determine
  /// the possible dimension values.
  /// <note>
  /// You cannot group by any dimension values for
  /// <code>GetSavingsPlansUtilization</code>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  ///
  /// Parameter [timePeriod] :
  /// The time period that you want the usage and costs for. The
  /// <code>Start</code> date must be within 13 months. The <code>End</code>
  /// date must be after the <code>Start</code> date, and before the current
  /// date. Future dates can't be used as an <code>End</code> date.
  ///
  /// Parameter [filter] :
  /// Filters Savings Plans utilization coverage data for active Savings Plans
  /// dimensions. You can filter data with the following dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>LINKED_ACCOUNT</code>
  /// </li>
  /// <li>
  /// <code>SAVINGS_PLAN_ARN</code>
  /// </li>
  /// <li>
  /// <code>SAVINGS_PLANS_TYPE</code>
  /// </li>
  /// <li>
  /// <code>REGION</code>
  /// </li>
  /// <li>
  /// <code>PAYMENT_OPTION</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_TYPE_FAMILY</code>
  /// </li>
  /// </ul>
  /// <code>GetSavingsPlansUtilization</code> uses the same <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object as the other operations, but only <code>AND</code> is supported
  /// among each dimension.
  ///
  /// Parameter [granularity] :
  /// The granularity of the Amazon Web Services utillization data for your
  /// Savings Plans.
  ///
  /// The <code>GetSavingsPlansUtilization</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  Future<GetSavingsPlansUtilizationResponse> getSavingsPlansUtilization({
    @_s.required DateInterval timePeriod,
    Expression filter,
    Granularity granularity,
  }) async {
    ArgumentError.checkNotNull(timePeriod, 'timePeriod');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetSavingsPlansUtilization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        'Filter': filter,
        'Granularity': granularity?.toValue(),
      },
    );

    return GetSavingsPlansUtilizationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves attribute data along with aggregate utilization and savings data
  /// for a given time period. This doesn't support granular or grouped data
  /// (daily/monthly) in response. You can't retrieve data by dates in a single
  /// response similar to <code>GetSavingsPlanUtilization</code>, but you have
  /// the option to make multiple calls to
  /// <code>GetSavingsPlanUtilizationDetails</code> by providing individual
  /// dates. You can use <code>GetDimensionValues</code> in
  /// <code>SAVINGS_PLANS</code> to determine the possible dimension values.
  /// <note>
  /// <code>GetSavingsPlanUtilizationDetails</code> internally groups data by
  /// <code>SavingsPlansArn</code>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [timePeriod] :
  /// The time period that you want the usage and costs for. The
  /// <code>Start</code> date must be within 13 months. The <code>End</code>
  /// date must be after the <code>Start</code> date, and before the current
  /// date. Future dates can't be used as an <code>End</code> date.
  ///
  /// Parameter [filter] :
  /// Filters Savings Plans utilization coverage data for active Savings Plans
  /// dimensions. You can filter data with the following dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>LINKED_ACCOUNT</code>
  /// </li>
  /// <li>
  /// <code>SAVINGS_PLAN_ARN</code>
  /// </li>
  /// <li>
  /// <code>REGION</code>
  /// </li>
  /// <li>
  /// <code>PAYMENT_OPTION</code>
  /// </li>
  /// <li>
  /// <code>INSTANCE_TYPE_FAMILY</code>
  /// </li>
  /// </ul>
  /// <code>GetSavingsPlansUtilizationDetails</code> uses the same <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object as the other operations, but only <code>AND</code> is supported
  /// among each dimension.
  ///
  /// Parameter [maxResults] :
  /// The number of items to be returned in a response. The default is
  /// <code>20</code>, with a minimum value of <code>1</code>.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<GetSavingsPlansUtilizationDetailsResponse>
      getSavingsPlansUtilizationDetails({
    @_s.required DateInterval timePeriod,
    Expression filter,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(timePeriod, 'timePeriod');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S\s]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSInsightsIndexService.GetSavingsPlansUtilizationDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        'Filter': filter,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return GetSavingsPlansUtilizationDetailsResponse.fromJson(
        jsonResponse.body);
  }

  /// Queries for available tag keys and tag values for a specified period. You
  /// can search the tag values for an arbitrary string.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BillExpirationException].
  /// May throw [DataUnavailableException].
  /// May throw [InvalidNextTokenException].
  /// May throw [RequestChangedException].
  ///
  /// Parameter [timePeriod] :
  /// The start and end dates for retrieving the dimension values. The start
  /// date is inclusive, but the end date is exclusive. For example, if
  /// <code>start</code> is <code>2017-01-01</code> and <code>end</code> is
  /// <code>2017-05-01</code>, then the cost and usage data is retrieved from
  /// <code>2017-01-01</code> up to and including <code>2017-04-30</code> but
  /// not including <code>2017-05-01</code>.
  ///
  /// Parameter [nextPageToken] :
  /// The token to retrieve the next set of results. AWS provides the token when
  /// the response from a previous call has more results than the maximum page
  /// size.
  ///
  /// Parameter [searchString] :
  /// The value that you want to search for.
  ///
  /// Parameter [tagKey] :
  /// The key of the tag that you want to return values for.
  Future<GetTagsResponse> getTags({
    @_s.required DateInterval timePeriod,
    String nextPageToken,
    String searchString,
    String tagKey,
  }) async {
    ArgumentError.checkNotNull(timePeriod, 'timePeriod');
    _s.validateStringLength(
      'nextPageToken',
      nextPageToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextPageToken',
      nextPageToken,
      r'''[\S\s]*''',
    );
    _s.validateStringLength(
      'searchString',
      searchString,
      0,
      1024,
    );
    _s.validateStringPattern(
      'searchString',
      searchString,
      r'''[\S\s]*''',
    );
    _s.validateStringLength(
      'tagKey',
      tagKey,
      0,
      1024,
    );
    _s.validateStringPattern(
      'tagKey',
      tagKey,
      r'''[\S\s]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TimePeriod': timePeriod,
        'NextPageToken': nextPageToken,
        'SearchString': searchString,
        'TagKey': tagKey,
      },
    );

    return GetTagsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a forecast for how much Amazon Web Services predicts that you
  /// will use over the forecast time period that you select, based on your past
  /// usage.
  ///
  /// May throw [LimitExceededException].
  /// May throw [DataUnavailableException].
  /// May throw [UnresolvableUsageUnitException].
  ///
  /// Parameter [granularity] :
  /// How granular you want the forecast to be. You can get 3 months of
  /// <code>DAILY</code> forecasts or 12 months of <code>MONTHLY</code>
  /// forecasts.
  ///
  /// The <code>GetUsageForecast</code> operation supports only
  /// <code>DAILY</code> and <code>MONTHLY</code> granularities.
  ///
  /// Parameter [metric] :
  /// Which metric Cost Explorer uses to create your forecast.
  ///
  /// Valid values for a <code>GetUsageForecast</code> call are the following:
  ///
  /// <ul>
  /// <li>
  /// USAGE_QUANTITY
  /// </li>
  /// <li>
  /// NORMALIZED_USAGE_AMOUNT
  /// </li>
  /// </ul>
  ///
  /// Parameter [timePeriod] :
  /// The start and end dates of the period that you want to retrieve usage
  /// forecast for. The start date is inclusive, but the end date is exclusive.
  /// For example, if <code>start</code> is <code>2017-01-01</code> and
  /// <code>end</code> is <code>2017-05-01</code>, then the cost and usage data
  /// is retrieved from <code>2017-01-01</code> up to and including
  /// <code>2017-04-30</code> but not including <code>2017-05-01</code>.
  ///
  /// Parameter [filter] :
  /// The filters that you want to use to filter your forecast. Cost Explorer
  /// API supports all of the Cost Explorer filters.
  ///
  /// Parameter [predictionIntervalLevel] :
  /// Cost Explorer always returns the mean forecast as a single point. You can
  /// request a prediction interval around the mean by specifying a confidence
  /// level. The higher the confidence level, the more confident Cost Explorer
  /// is about the actual value falling in the prediction interval. Higher
  /// confidence levels result in wider prediction intervals.
  Future<GetUsageForecastResponse> getUsageForecast({
    @_s.required Granularity granularity,
    @_s.required Metric metric,
    @_s.required DateInterval timePeriod,
    Expression filter,
    int predictionIntervalLevel,
  }) async {
    ArgumentError.checkNotNull(granularity, 'granularity');
    ArgumentError.checkNotNull(metric, 'metric');
    ArgumentError.checkNotNull(timePeriod, 'timePeriod');
    _s.validateNumRange(
      'predictionIntervalLevel',
      predictionIntervalLevel,
      51,
      99,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.GetUsageForecast'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Granularity': granularity?.toValue(),
        'Metric': metric?.toValue(),
        'TimePeriod': timePeriod,
        'Filter': filter,
        'PredictionIntervalLevel': predictionIntervalLevel,
      },
    );

    return GetUsageForecastResponse.fromJson(jsonResponse.body);
  }

  /// Returns the name, ARN, <code>NumberOfRules</code> and effective dates of
  /// all Cost Categories defined in the account. You have the option to use
  /// <code>EffectiveOn</code> to return a list of Cost Categories that were
  /// active on a specific date. If there is no <code>EffectiveOn</code>
  /// specified, you’ll see Cost Categories that are effective on the current
  /// date. If Cost Category is still effective, <code>EffectiveEnd</code> is
  /// omitted in the response. <code>ListCostCategoryDefinitions</code> supports
  /// pagination. The request can have a <code>MaxResults</code> range up to
  /// 100.
  ///
  /// May throw [LimitExceededException].
  ///
  /// Parameter [effectiveOn] :
  /// The date when the Cost Category was effective.
  ///
  /// Parameter [maxResults] :
  /// The number of entries a paginated response contains.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results. Amazon Web Services
  /// provides the token when the response from a previous call has more results
  /// than the maximum page size.
  Future<ListCostCategoryDefinitionsResponse> listCostCategoryDefinitions({
    String effectiveOn,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'effectiveOn',
      effectiveOn,
      20,
      25,
    );
    _s.validateStringPattern(
      'effectiveOn',
      effectiveOn,
      r'''^\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d(([+-]\d\d:\d\d)|Z)$''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S\s]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.ListCostCategoryDefinitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EffectiveOn': effectiveOn,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListCostCategoryDefinitionsResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing Cost Category. Changes made to the Cost Category rules
  /// will be used to categorize the current month’s expenses and future
  /// expenses. This won’t change categorization for the previous months.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [costCategoryArn] :
  /// The unique identifier for your Cost Category.
  ///
  /// Parameter [rules] :
  /// The <code>Expression</code> object used to categorize costs. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategoryRule.html">CostCategoryRule
  /// </a>.
  Future<UpdateCostCategoryDefinitionResponse> updateCostCategoryDefinition({
    @_s.required String costCategoryArn,
    @_s.required CostCategoryRuleVersion ruleVersion,
    @_s.required List<CostCategoryRule> rules,
  }) async {
    ArgumentError.checkNotNull(costCategoryArn, 'costCategoryArn');
    _s.validateStringLength(
      'costCategoryArn',
      costCategoryArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'costCategoryArn',
      costCategoryArn,
      r'''arn:aws[-a-z0-9]*:[a-z0-9]+:[-a-z0-9]*:[0-9]{12}:[-a-zA-Z0-9/:_]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(ruleVersion, 'ruleVersion');
    ArgumentError.checkNotNull(rules, 'rules');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSInsightsIndexService.UpdateCostCategoryDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CostCategoryArn': costCategoryArn,
        'RuleVersion': ruleVersion?.toValue(),
        'Rules': rules,
      },
    );

    return UpdateCostCategoryDefinitionResponse.fromJson(jsonResponse.body);
  }
}

enum AccountScope {
  @_s.JsonValue('PAYER')
  payer,
  @_s.JsonValue('LINKED')
  linked,
}

extension on AccountScope {
  String toValue() {
    switch (this) {
      case AccountScope.payer:
        return 'PAYER';
      case AccountScope.linked:
        return 'LINKED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum Context {
  @_s.JsonValue('COST_AND_USAGE')
  costAndUsage,
  @_s.JsonValue('RESERVATIONS')
  reservations,
  @_s.JsonValue('SAVINGS_PLANS')
  savingsPlans,
}

extension on Context {
  String toValue() {
    switch (this) {
      case Context.costAndUsage:
        return 'COST_AND_USAGE';
      case Context.reservations:
        return 'RESERVATIONS';
      case Context.savingsPlans:
        return 'SAVINGS_PLANS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The structure of Cost Categories. This includes detailed metadata and the
/// set of rules for the <code>CostCategory</code> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CostCategory {
  /// The unique identifier for your Cost Category.
  @_s.JsonKey(name: 'CostCategoryArn')
  final String costCategoryArn;

  /// The Cost Category's effective start date.
  @_s.JsonKey(name: 'EffectiveStart')
  final String effectiveStart;
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'RuleVersion')
  final CostCategoryRuleVersion ruleVersion;

  /// Rules are processed in order. If there are multiple rules that match the
  /// line item, then the first rule to match is used to determine that Cost
  /// Category value.
  @_s.JsonKey(name: 'Rules')
  final List<CostCategoryRule> rules;

  /// The Cost Category's effective end date.
  @_s.JsonKey(name: 'EffectiveEnd')
  final String effectiveEnd;

  CostCategory({
    @_s.required this.costCategoryArn,
    @_s.required this.effectiveStart,
    @_s.required this.name,
    @_s.required this.ruleVersion,
    @_s.required this.rules,
    this.effectiveEnd,
  });
  factory CostCategory.fromJson(Map<String, dynamic> json) =>
      _$CostCategoryFromJson(json);
}

/// A reference to a Cost Category containing only enough information to
/// identify the Cost Category.
///
/// You can use this information to retrieve the full Cost Category information
/// using <code>DescribeCostCategory</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CostCategoryReference {
  /// The unique identifier for your Cost Category.
  @_s.JsonKey(name: 'CostCategoryArn')
  final String costCategoryArn;

  /// The Cost Category's effective end date.
  @_s.JsonKey(name: 'EffectiveEnd')
  final String effectiveEnd;

  /// The Cost Category's effective start date.
  @_s.JsonKey(name: 'EffectiveStart')
  final String effectiveStart;
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The number of rules associated with a specific Cost Category.
  @_s.JsonKey(name: 'NumberOfRules')
  final int numberOfRules;

  CostCategoryReference({
    this.costCategoryArn,
    this.effectiveEnd,
    this.effectiveStart,
    this.name,
    this.numberOfRules,
  });
  factory CostCategoryReference.fromJson(Map<String, dynamic> json) =>
      _$CostCategoryReferenceFromJson(json);
}

/// Rules are processed in order. If there are multiple rules that match the
/// line item, then the first rule to match is used to determine that Cost
/// Category value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CostCategoryRule {
  /// An <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html">Expression</a>
  /// object used to categorize costs. This supports dimensions, Tags, and nested
  /// expressions. Currently the only dimensions supported are
  /// <code>LINKED_ACCOUNT</code>, <code>SERVICE_CODE</code>,
  /// <code>RECORD_TYPE</code>, and <code>LINKED_ACCOUNT_NAME</code>.
  ///
  /// Root level <code>OR</code> is not supported. We recommend that you create a
  /// separate rule instead.
  ///
  /// <code>RECORD_TYPE</code> is a dimension used for Cost Explorer APIs, and is
  /// also supported for Cost Category expressions. This dimension uses different
  /// terms, depending on whether you're using the console or API/JSON editor. For
  /// a detailed comparison, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/manage-cost-categories.html#cost-categories-terms">Term
  /// Comparisons</a> in the <i>AWS Billing and Cost Management User Guide</i>.
  @_s.JsonKey(name: 'Rule')
  final Expression rule;
  @_s.JsonKey(name: 'Value')
  final String value;

  CostCategoryRule({
    @_s.required this.rule,
    @_s.required this.value,
  });
  factory CostCategoryRule.fromJson(Map<String, dynamic> json) =>
      _$CostCategoryRuleFromJson(json);

  Map<String, dynamic> toJson() => _$CostCategoryRuleToJson(this);
}

/// The rule schema version in this particular Cost Category.
enum CostCategoryRuleVersion {
  @_s.JsonValue('CostCategoryExpression.v1')
  costCategoryExpressionV1,
}

extension on CostCategoryRuleVersion {
  String toValue() {
    switch (this) {
      case CostCategoryRuleVersion.costCategoryExpressionV1:
        return 'CostCategoryExpression.v1';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The Cost Categories values used for filtering the costs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CostCategoryValues {
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The specific value of the Cost Category.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  CostCategoryValues({
    this.key,
    this.values,
  });
  factory CostCategoryValues.fromJson(Map<String, dynamic> json) =>
      _$CostCategoryValuesFromJson(json);

  Map<String, dynamic> toJson() => _$CostCategoryValuesToJson(this);
}

/// The amount of instance usage that a reservation covered.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Coverage {
  /// The amount of cost that the reservation covered.
  @_s.JsonKey(name: 'CoverageCost')
  final CoverageCost coverageCost;

  /// The amount of instance usage that the reservation covered, in hours.
  @_s.JsonKey(name: 'CoverageHours')
  final CoverageHours coverageHours;

  /// The amount of instance usage that the reservation covered, in normalized
  /// units.
  @_s.JsonKey(name: 'CoverageNormalizedUnits')
  final CoverageNormalizedUnits coverageNormalizedUnits;

  Coverage({
    this.coverageCost,
    this.coverageHours,
    this.coverageNormalizedUnits,
  });
  factory Coverage.fromJson(Map<String, dynamic> json) =>
      _$CoverageFromJson(json);
}

/// Reservation coverage for a specified period, in hours.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CoverageByTime {
  /// The groups of instances that the reservation covered.
  @_s.JsonKey(name: 'Groups')
  final List<ReservationCoverageGroup> groups;

  /// The period that this coverage was used over.
  @_s.JsonKey(name: 'TimePeriod')
  final DateInterval timePeriod;

  /// The total reservation coverage, in hours.
  @_s.JsonKey(name: 'Total')
  final Coverage total;

  CoverageByTime({
    this.groups,
    this.timePeriod,
    this.total,
  });
  factory CoverageByTime.fromJson(Map<String, dynamic> json) =>
      _$CoverageByTimeFromJson(json);
}

/// How much it costs to run an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CoverageCost {
  /// How much an On-Demand Instance costs.
  @_s.JsonKey(name: 'OnDemandCost')
  final String onDemandCost;

  CoverageCost({
    this.onDemandCost,
  });
  factory CoverageCost.fromJson(Map<String, dynamic> json) =>
      _$CoverageCostFromJson(json);
}

/// How long a running instance either used a reservation or was On-Demand.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CoverageHours {
  /// The percentage of instance hours that a reservation covered.
  @_s.JsonKey(name: 'CoverageHoursPercentage')
  final String coverageHoursPercentage;

  /// The number of instance running hours that On-Demand Instances covered.
  @_s.JsonKey(name: 'OnDemandHours')
  final String onDemandHours;

  /// The number of instance running hours that reservations covered.
  @_s.JsonKey(name: 'ReservedHours')
  final String reservedHours;

  /// The total instance usage, in hours.
  @_s.JsonKey(name: 'TotalRunningHours')
  final String totalRunningHours;

  CoverageHours({
    this.coverageHoursPercentage,
    this.onDemandHours,
    this.reservedHours,
    this.totalRunningHours,
  });
  factory CoverageHours.fromJson(Map<String, dynamic> json) =>
      _$CoverageHoursFromJson(json);
}

/// The amount of instance usage, in normalized units. Normalized units enable
/// you to see your EC2 usage for multiple sizes of instances in a uniform way.
/// For example, suppose you run an xlarge instance and a 2xlarge instance. If
/// you run both instances for the same amount of time, the 2xlarge instance
/// uses twice as much of your reservation as the xlarge instance, even though
/// both instances show only one instance-hour. Using normalized units instead
/// of instance-hours, the xlarge instance used 8 normalized units, and the
/// 2xlarge instance used 16 normalized units.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html">Modifying
/// Reserved Instances</a> in the <i>Amazon Elastic Compute Cloud User Guide for
/// Linux Instances</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CoverageNormalizedUnits {
  /// The percentage of your used instance normalized units that a reservation
  /// covers.
  @_s.JsonKey(name: 'CoverageNormalizedUnitsPercentage')
  final String coverageNormalizedUnitsPercentage;

  /// The number of normalized units that are covered by On-Demand Instances
  /// instead of a reservation.
  @_s.JsonKey(name: 'OnDemandNormalizedUnits')
  final String onDemandNormalizedUnits;

  /// The number of normalized units that a reservation covers.
  @_s.JsonKey(name: 'ReservedNormalizedUnits')
  final String reservedNormalizedUnits;

  /// The total number of normalized units that you used.
  @_s.JsonKey(name: 'TotalRunningNormalizedUnits')
  final String totalRunningNormalizedUnits;

  CoverageNormalizedUnits({
    this.coverageNormalizedUnitsPercentage,
    this.onDemandNormalizedUnits,
    this.reservedNormalizedUnits,
    this.totalRunningNormalizedUnits,
  });
  factory CoverageNormalizedUnits.fromJson(Map<String, dynamic> json) =>
      _$CoverageNormalizedUnitsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCostCategoryDefinitionResponse {
  /// The unique identifier for your newly created Cost Category.
  @_s.JsonKey(name: 'CostCategoryArn')
  final String costCategoryArn;

  /// The Cost Category's effective start date.
  @_s.JsonKey(name: 'EffectiveStart')
  final String effectiveStart;

  CreateCostCategoryDefinitionResponse({
    this.costCategoryArn,
    this.effectiveStart,
  });
  factory CreateCostCategoryDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCostCategoryDefinitionResponseFromJson(json);
}

/// Context about the current instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CurrentInstance {
  /// The currency code that Amazon Web Services used to calculate the costs for
  /// this instance.
  @_s.JsonKey(name: 'CurrencyCode')
  final String currencyCode;

  /// Current On Demand cost of operating this instance on a monthly basis.
  @_s.JsonKey(name: 'MonthlyCost')
  final String monthlyCost;

  /// Number of hours during the lookback period billed at On Demand rates.
  @_s.JsonKey(name: 'OnDemandHoursInLookbackPeriod')
  final String onDemandHoursInLookbackPeriod;

  /// Number of hours during the lookback period covered by reservations.
  @_s.JsonKey(name: 'ReservationCoveredHoursInLookbackPeriod')
  final String reservationCoveredHoursInLookbackPeriod;

  /// Details about the resource and utilization.
  @_s.JsonKey(name: 'ResourceDetails')
  final ResourceDetails resourceDetails;

  /// Resource ID of the current instance.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// Utilization information of the current instance during the lookback period.
  @_s.JsonKey(name: 'ResourceUtilization')
  final ResourceUtilization resourceUtilization;

  /// Number of hours during the lookback period covered by Savings Plans.
  @_s.JsonKey(name: 'SavingsPlansCoveredHoursInLookbackPeriod')
  final String savingsPlansCoveredHoursInLookbackPeriod;

  /// Cost allocation resource tags applied to the instance.
  @_s.JsonKey(name: 'Tags')
  final List<TagValues> tags;

  /// The total number of hours the instance ran during the lookback period.
  @_s.JsonKey(name: 'TotalRunningHoursInLookbackPeriod')
  final String totalRunningHoursInLookbackPeriod;

  CurrentInstance({
    this.currencyCode,
    this.monthlyCost,
    this.onDemandHoursInLookbackPeriod,
    this.reservationCoveredHoursInLookbackPeriod,
    this.resourceDetails,
    this.resourceId,
    this.resourceUtilization,
    this.savingsPlansCoveredHoursInLookbackPeriod,
    this.tags,
    this.totalRunningHoursInLookbackPeriod,
  });
  factory CurrentInstance.fromJson(Map<String, dynamic> json) =>
      _$CurrentInstanceFromJson(json);
}

/// The time period that you want the usage and costs for.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DateInterval {
  /// The end of the time period that you want the usage and costs for. The end
  /// date is exclusive. For example, if <code>end</code> is
  /// <code>2017-05-01</code>, AWS retrieves cost and usage data from the start
  /// date up to, but not including, <code>2017-05-01</code>.
  @_s.JsonKey(name: 'End')
  final String end;

  /// The beginning of the time period that you want the usage and costs for. The
  /// start date is inclusive. For example, if <code>start</code> is
  /// <code>2017-01-01</code>, AWS retrieves cost and usage data starting at
  /// <code>2017-01-01</code> up to the end date.
  @_s.JsonKey(name: 'Start')
  final String start;

  DateInterval({
    @_s.required this.end,
    @_s.required this.start,
  });
  factory DateInterval.fromJson(Map<String, dynamic> json) =>
      _$DateIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$DateIntervalToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCostCategoryDefinitionResponse {
  /// The unique identifier for your Cost Category.
  @_s.JsonKey(name: 'CostCategoryArn')
  final String costCategoryArn;

  /// The effective end date of the Cost Category as a result of deleting it. No
  /// costs after this date will be categorized by the deleted Cost Category.
  @_s.JsonKey(name: 'EffectiveEnd')
  final String effectiveEnd;

  DeleteCostCategoryDefinitionResponse({
    this.costCategoryArn,
    this.effectiveEnd,
  });
  factory DeleteCostCategoryDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteCostCategoryDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCostCategoryDefinitionResponse {
  @_s.JsonKey(name: 'CostCategory')
  final CostCategory costCategory;

  DescribeCostCategoryDefinitionResponse({
    this.costCategory,
  });
  factory DescribeCostCategoryDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeCostCategoryDefinitionResponseFromJson(json);
}

enum Dimension {
  @_s.JsonValue('AZ')
  az,
  @_s.JsonValue('INSTANCE_TYPE')
  instanceType,
  @_s.JsonValue('LINKED_ACCOUNT')
  linkedAccount,
  @_s.JsonValue('LINKED_ACCOUNT_NAME')
  linkedAccountName,
  @_s.JsonValue('OPERATION')
  operation,
  @_s.JsonValue('PURCHASE_TYPE')
  purchaseType,
  @_s.JsonValue('REGION')
  region,
  @_s.JsonValue('SERVICE')
  service,
  @_s.JsonValue('SERVICE_CODE')
  serviceCode,
  @_s.JsonValue('USAGE_TYPE')
  usageType,
  @_s.JsonValue('USAGE_TYPE_GROUP')
  usageTypeGroup,
  @_s.JsonValue('RECORD_TYPE')
  recordType,
  @_s.JsonValue('OPERATING_SYSTEM')
  operatingSystem,
  @_s.JsonValue('TENANCY')
  tenancy,
  @_s.JsonValue('SCOPE')
  scope,
  @_s.JsonValue('PLATFORM')
  platform,
  @_s.JsonValue('SUBSCRIPTION_ID')
  subscriptionId,
  @_s.JsonValue('LEGAL_ENTITY_NAME')
  legalEntityName,
  @_s.JsonValue('DEPLOYMENT_OPTION')
  deploymentOption,
  @_s.JsonValue('DATABASE_ENGINE')
  databaseEngine,
  @_s.JsonValue('CACHE_ENGINE')
  cacheEngine,
  @_s.JsonValue('INSTANCE_TYPE_FAMILY')
  instanceTypeFamily,
  @_s.JsonValue('BILLING_ENTITY')
  billingEntity,
  @_s.JsonValue('RESERVATION_ID')
  reservationId,
  @_s.JsonValue('RESOURCE_ID')
  resourceId,
  @_s.JsonValue('RIGHTSIZING_TYPE')
  rightsizingType,
  @_s.JsonValue('SAVINGS_PLANS_TYPE')
  savingsPlansType,
  @_s.JsonValue('SAVINGS_PLAN_ARN')
  savingsPlanArn,
  @_s.JsonValue('PAYMENT_OPTION')
  paymentOption,
}

extension on Dimension {
  String toValue() {
    switch (this) {
      case Dimension.az:
        return 'AZ';
      case Dimension.instanceType:
        return 'INSTANCE_TYPE';
      case Dimension.linkedAccount:
        return 'LINKED_ACCOUNT';
      case Dimension.linkedAccountName:
        return 'LINKED_ACCOUNT_NAME';
      case Dimension.operation:
        return 'OPERATION';
      case Dimension.purchaseType:
        return 'PURCHASE_TYPE';
      case Dimension.region:
        return 'REGION';
      case Dimension.service:
        return 'SERVICE';
      case Dimension.serviceCode:
        return 'SERVICE_CODE';
      case Dimension.usageType:
        return 'USAGE_TYPE';
      case Dimension.usageTypeGroup:
        return 'USAGE_TYPE_GROUP';
      case Dimension.recordType:
        return 'RECORD_TYPE';
      case Dimension.operatingSystem:
        return 'OPERATING_SYSTEM';
      case Dimension.tenancy:
        return 'TENANCY';
      case Dimension.scope:
        return 'SCOPE';
      case Dimension.platform:
        return 'PLATFORM';
      case Dimension.subscriptionId:
        return 'SUBSCRIPTION_ID';
      case Dimension.legalEntityName:
        return 'LEGAL_ENTITY_NAME';
      case Dimension.deploymentOption:
        return 'DEPLOYMENT_OPTION';
      case Dimension.databaseEngine:
        return 'DATABASE_ENGINE';
      case Dimension.cacheEngine:
        return 'CACHE_ENGINE';
      case Dimension.instanceTypeFamily:
        return 'INSTANCE_TYPE_FAMILY';
      case Dimension.billingEntity:
        return 'BILLING_ENTITY';
      case Dimension.reservationId:
        return 'RESERVATION_ID';
      case Dimension.resourceId:
        return 'RESOURCE_ID';
      case Dimension.rightsizingType:
        return 'RIGHTSIZING_TYPE';
      case Dimension.savingsPlansType:
        return 'SAVINGS_PLANS_TYPE';
      case Dimension.savingsPlanArn:
        return 'SAVINGS_PLAN_ARN';
      case Dimension.paymentOption:
        return 'PAYMENT_OPTION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The metadata that you can use to filter and group your results. You can use
/// <code>GetDimensionValues</code> to find specific values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DimensionValues {
  /// The names of the metadata types that you can use to filter and group your
  /// results. For example, <code>AZ</code> returns a list of Availability Zones.
  @_s.JsonKey(name: 'Key')
  final Dimension key;

  /// The match options that you can use to filter your results.
  /// <code>MatchOptions</code> is only applicable for actions related to Cost
  /// Category. The default values for <code>MatchOptions</code> is
  /// <code>EQUALS</code> and <code>CASE_SENSITIVE</code>.
  @_s.JsonKey(name: 'MatchOptions')
  final List<String> matchOptions;

  /// The metadata values that you can use to filter and group your results. You
  /// can use <code>GetDimensionValues</code> to find specific values.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  DimensionValues({
    this.key,
    this.matchOptions,
    this.values,
  });
  factory DimensionValues.fromJson(Map<String, dynamic> json) =>
      _$DimensionValuesFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionValuesToJson(this);
}

/// The metadata of a specific type that you can use to filter and group your
/// results. You can use <code>GetDimensionValues</code> to find specific
/// values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DimensionValuesWithAttributes {
  /// The attribute that applies to a specific <code>Dimension</code>.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// The value of a dimension with a specific attribute.
  @_s.JsonKey(name: 'Value')
  final String value;

  DimensionValuesWithAttributes({
    this.attributes,
    this.value,
  });
  factory DimensionValuesWithAttributes.fromJson(Map<String, dynamic> json) =>
      _$DimensionValuesWithAttributesFromJson(json);
}

/// Details about the Amazon EC2 instances that AWS recommends that you
/// purchase.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EC2InstanceDetails {
  /// The Availability Zone of the recommended reservation.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// Whether the recommendation is for a current-generation instance.
  @_s.JsonKey(name: 'CurrentGeneration')
  final bool currentGeneration;

  /// The instance family of the recommended reservation.
  @_s.JsonKey(name: 'Family')
  final String family;

  /// The type of instance that AWS recommends.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// The platform of the recommended reservation. The platform is the specific
  /// combination of operating system, license model, and software on an instance.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The AWS Region of the recommended reservation.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// Whether the recommended reservation is size flexible.
  @_s.JsonKey(name: 'SizeFlexEligible')
  final bool sizeFlexEligible;

  /// Whether the recommended reservation is dedicated or shared.
  @_s.JsonKey(name: 'Tenancy')
  final String tenancy;

  EC2InstanceDetails({
    this.availabilityZone,
    this.currentGeneration,
    this.family,
    this.instanceType,
    this.platform,
    this.region,
    this.sizeFlexEligible,
    this.tenancy,
  });
  factory EC2InstanceDetails.fromJson(Map<String, dynamic> json) =>
      _$EC2InstanceDetailsFromJson(json);
}

/// Details on the Amazon EC2 Resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EC2ResourceDetails {
  /// Hourly public On Demand rate for the instance type.
  @_s.JsonKey(name: 'HourlyOnDemandRate')
  final String hourlyOnDemandRate;

  /// The type of Amazon Web Services instance.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// Memory capacity of Amazon Web Services instance.
  @_s.JsonKey(name: 'Memory')
  final String memory;

  /// Network performance capacity of the Amazon Web Services instance.
  @_s.JsonKey(name: 'NetworkPerformance')
  final String networkPerformance;

  /// The platform of the Amazon Web Services instance. The platform is the
  /// specific combination of operating system, license model, and software on an
  /// instance.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The Amazon Web Services Region of the instance.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// The SKU of the product.
  @_s.JsonKey(name: 'Sku')
  final String sku;

  /// The disk storage of the Amazon Web Services instance (Not EBS storage).
  @_s.JsonKey(name: 'Storage')
  final String storage;

  /// Number of VCPU cores in the Amazon Web Services instance type.
  @_s.JsonKey(name: 'Vcpu')
  final String vcpu;

  EC2ResourceDetails({
    this.hourlyOnDemandRate,
    this.instanceType,
    this.memory,
    this.networkPerformance,
    this.platform,
    this.region,
    this.sku,
    this.storage,
    this.vcpu,
  });
  factory EC2ResourceDetails.fromJson(Map<String, dynamic> json) =>
      _$EC2ResourceDetailsFromJson(json);
}

/// Utilization metrics of the instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EC2ResourceUtilization {
  /// Maximum observed or expected CPU utilization of the instance.
  @_s.JsonKey(name: 'MaxCpuUtilizationPercentage')
  final String maxCpuUtilizationPercentage;

  /// Maximum observed or expected memory utilization of the instance.
  @_s.JsonKey(name: 'MaxMemoryUtilizationPercentage')
  final String maxMemoryUtilizationPercentage;

  /// Maximum observed or expected storage utilization of the instance (does not
  /// measure EBS storage).
  @_s.JsonKey(name: 'MaxStorageUtilizationPercentage')
  final String maxStorageUtilizationPercentage;

  EC2ResourceUtilization({
    this.maxCpuUtilizationPercentage,
    this.maxMemoryUtilizationPercentage,
    this.maxStorageUtilizationPercentage,
  });
  factory EC2ResourceUtilization.fromJson(Map<String, dynamic> json) =>
      _$EC2ResourceUtilizationFromJson(json);
}

/// The Amazon EC2 hardware specifications that you want AWS to provide
/// recommendations for.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EC2Specification {
  /// Whether you want a recommendation for standard or convertible reservations.
  @_s.JsonKey(name: 'OfferingClass')
  final OfferingClass offeringClass;

  EC2Specification({
    this.offeringClass,
  });
  factory EC2Specification.fromJson(Map<String, dynamic> json) =>
      _$EC2SpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$EC2SpecificationToJson(this);
}

/// Details about the Amazon ES instances that AWS recommends that you purchase.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ESInstanceDetails {
  /// Whether the recommendation is for a current-generation instance.
  @_s.JsonKey(name: 'CurrentGeneration')
  final bool currentGeneration;

  /// The class of instance that AWS recommends.
  @_s.JsonKey(name: 'InstanceClass')
  final String instanceClass;

  /// The size of instance that AWS recommends.
  @_s.JsonKey(name: 'InstanceSize')
  final String instanceSize;

  /// The AWS Region of the recommended reservation.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// Whether the recommended reservation is size flexible.
  @_s.JsonKey(name: 'SizeFlexEligible')
  final bool sizeFlexEligible;

  ESInstanceDetails({
    this.currentGeneration,
    this.instanceClass,
    this.instanceSize,
    this.region,
    this.sizeFlexEligible,
  });
  factory ESInstanceDetails.fromJson(Map<String, dynamic> json) =>
      _$ESInstanceDetailsFromJson(json);
}

/// Details about the Amazon ElastiCache instances that AWS recommends that you
/// purchase.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ElastiCacheInstanceDetails {
  /// Whether the recommendation is for a current generation instance.
  @_s.JsonKey(name: 'CurrentGeneration')
  final bool currentGeneration;

  /// The instance family of the recommended reservation.
  @_s.JsonKey(name: 'Family')
  final String family;

  /// The type of node that AWS recommends.
  @_s.JsonKey(name: 'NodeType')
  final String nodeType;

  /// The description of the recommended reservation.
  @_s.JsonKey(name: 'ProductDescription')
  final String productDescription;

  /// The AWS Region of the recommended reservation.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// Whether the recommended reservation is size flexible.
  @_s.JsonKey(name: 'SizeFlexEligible')
  final bool sizeFlexEligible;

  ElastiCacheInstanceDetails({
    this.currentGeneration,
    this.family,
    this.nodeType,
    this.productDescription,
    this.region,
    this.sizeFlexEligible,
  });
  factory ElastiCacheInstanceDetails.fromJson(Map<String, dynamic> json) =>
      _$ElastiCacheInstanceDetailsFromJson(json);
}

/// Use <code>Expression</code> to filter by cost or by usage. There are two
/// patterns:
///
/// <ul>
/// <li>
/// Simple dimension values - You can set the dimension name and values for the
/// filters that you plan to use. For example, you can filter for
/// <code>REGION==us-east-1 OR REGION==us-west-1</code>. The
/// <code>Expression</code> for that looks like this:
///
/// <code>{ "Dimensions": { "Key": "REGION", "Values": [ "us-east-1",
/// “us-west-1” ] } }</code>
///
/// The list of dimension values are OR'd together to retrieve cost or usage
/// data. You can create <code>Expression</code> and
/// <code>DimensionValues</code> objects using either <code>with*</code> methods
/// or <code>set*</code> methods in multiple lines.
/// </li>
/// <li>
/// Compound dimension values with logical operations - You can use multiple
/// <code>Expression</code> types and the logical operators
/// <code>AND/OR/NOT</code> to create a list of one or more
/// <code>Expression</code> objects. This allows you to filter on more advanced
/// options. For example, you can filter on <code>((REGION == us-east-1 OR
/// REGION == us-west-1) OR (TAG.Type == Type1)) AND (USAGE_TYPE !=
/// DataTransfer)</code>. The <code>Expression</code> for that looks like this:
///
/// <code>{ "And": [ {"Or": [ {"Dimensions": { "Key": "REGION", "Values": [
/// "us-east-1", "us-west-1" ] }}, {"Tags": { "Key": "TagName", "Values":
/// ["Value1"] } } ]}, {"Not": {"Dimensions": { "Key": "USAGE_TYPE", "Values":
/// ["DataTransfer"] }}} ] } </code>
/// <note>
/// Because each <code>Expression</code> can have only one operator, the service
/// returns an error if more than one is specified. The following example shows
/// an <code>Expression</code> object that creates an error.
/// </note>
/// <code> { "And": [ ... ], "DimensionValues": { "Dimension": "USAGE_TYPE",
/// "Values": [ "DataTransfer" ] } } </code>
/// </li>
/// </ul> <note>
/// For <code>GetRightsizingRecommendation</code> action, a combination of OR
/// and NOT is not supported. OR is not supported between different dimensions,
/// or dimensions and tags. NOT operators aren't supported. Dimensions are also
/// limited to <code>LINKED_ACCOUNT</code>, <code>REGION</code>, or
/// <code>RIGHTSIZING_TYPE</code>.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Expression {
  /// Return results that match both <code>Dimension</code> objects.
  @_s.JsonKey(name: 'And')
  final List<Expression> and;

  /// The filter based on <code>CostCategory</code> values.
  @_s.JsonKey(name: 'CostCategories')
  final CostCategoryValues costCategories;

  /// The specific <code>Dimension</code> to use for <code>Expression</code>.
  @_s.JsonKey(name: 'Dimensions')
  final DimensionValues dimensions;

  /// Return results that don't match a <code>Dimension</code> object.
  @_s.JsonKey(name: 'Not')
  final Expression not;

  /// Return results that match either <code>Dimension</code> object.
  @_s.JsonKey(name: 'Or')
  final List<Expression> or;

  /// The specific <code>Tag</code> to use for <code>Expression</code>.
  @_s.JsonKey(name: 'Tags')
  final TagValues tags;

  Expression({
    this.and,
    this.costCategories,
    this.dimensions,
    this.not,
    this.or,
    this.tags,
  });
  factory Expression.fromJson(Map<String, dynamic> json) =>
      _$ExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressionToJson(this);
}

/// The forecast created for your query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ForecastResult {
  /// The mean value of the forecast.
  @_s.JsonKey(name: 'MeanValue')
  final String meanValue;

  /// The lower limit for the prediction interval.
  @_s.JsonKey(name: 'PredictionIntervalLowerBound')
  final String predictionIntervalLowerBound;

  /// The upper limit for the prediction interval.
  @_s.JsonKey(name: 'PredictionIntervalUpperBound')
  final String predictionIntervalUpperBound;

  /// The period of time that the forecast covers.
  @_s.JsonKey(name: 'TimePeriod')
  final DateInterval timePeriod;

  ForecastResult({
    this.meanValue,
    this.predictionIntervalLowerBound,
    this.predictionIntervalUpperBound,
    this.timePeriod,
  });
  factory ForecastResult.fromJson(Map<String, dynamic> json) =>
      _$ForecastResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCostAndUsageResponse {
  /// The groups that are specified by the <code>Filter</code> or
  /// <code>GroupBy</code> parameters in the request.
  @_s.JsonKey(name: 'GroupDefinitions')
  final List<GroupDefinition> groupDefinitions;

  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// The time period that is covered by the results in the response.
  @_s.JsonKey(name: 'ResultsByTime')
  final List<ResultByTime> resultsByTime;

  GetCostAndUsageResponse({
    this.groupDefinitions,
    this.nextPageToken,
    this.resultsByTime,
  });
  factory GetCostAndUsageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCostAndUsageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCostAndUsageWithResourcesResponse {
  /// The groups that are specified by the <code>Filter</code> or
  /// <code>GroupBy</code> parameters in the request.
  @_s.JsonKey(name: 'GroupDefinitions')
  final List<GroupDefinition> groupDefinitions;

  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// The time period that is covered by the results in the response.
  @_s.JsonKey(name: 'ResultsByTime')
  final List<ResultByTime> resultsByTime;

  GetCostAndUsageWithResourcesResponse({
    this.groupDefinitions,
    this.nextPageToken,
    this.resultsByTime,
  });
  factory GetCostAndUsageWithResourcesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCostAndUsageWithResourcesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCostForecastResponse {
  /// The forecasts for your query, in order. For <code>DAILY</code> forecasts,
  /// this is a list of days. For <code>MONTHLY</code> forecasts, this is a list
  /// of months.
  @_s.JsonKey(name: 'ForecastResultsByTime')
  final List<ForecastResult> forecastResultsByTime;

  /// How much you are forecasted to spend over the forecast period, in
  /// <code>USD</code>.
  @_s.JsonKey(name: 'Total')
  final MetricValue total;

  GetCostForecastResponse({
    this.forecastResultsByTime,
    this.total,
  });
  factory GetCostForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCostForecastResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDimensionValuesResponse {
  /// The filters that you used to filter your request. Some dimensions are
  /// available only for a specific context.
  ///
  /// If you set the context to <code>COST_AND_USAGE</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// AZ - The Availability Zone. An example is <code>us-east-1a</code>.
  /// </li>
  /// <li>
  /// DATABASE_ENGINE - The Amazon Relational Database Service database. Examples
  /// are Aurora or MySQL.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// <code>m4.xlarge</code>.
  /// </li>
  /// <li>
  /// LEGAL_ENTITY_NAME - The name of the organization that sells you AWS
  /// services, such as Amazon Web Services.
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the full
  /// name of the member account. The value field contains the AWS ID of the
  /// member account.
  /// </li>
  /// <li>
  /// OPERATING_SYSTEM - The operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// OPERATION - The action performed. Examples include <code>RunInstance</code>
  /// and <code>CreateBucket</code>.
  /// </li>
  /// <li>
  /// PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// PURCHASE_TYPE - The reservation type of the purchase to which this usage is
  /// related. Examples include On-Demand Instances and Standard Reserved
  /// Instances.
  /// </li>
  /// <li>
  /// SERVICE - The AWS service such as Amazon DynamoDB.
  /// </li>
  /// <li>
  /// USAGE_TYPE - The type of usage. An example is DataTransfer-In-Bytes. The
  /// response for the <code>GetDimensionValues</code> operation includes a unit
  /// attribute. Examples include GB and Hrs.
  /// </li>
  /// <li>
  /// USAGE_TYPE_GROUP - The grouping of common usage types. An example is Amazon
  /// EC2: CloudWatch – Alarms. The response for this operation includes a unit
  /// attribute.
  /// </li>
  /// <li>
  /// RECORD_TYPE - The different types of charges such as RI fees, usage costs,
  /// tax refunds, and credits.
  /// </li>
  /// <li>
  /// RESOURCE_ID - The unique identifier of the resource. ResourceId is an opt-in
  /// feature only available for last 14 days for EC2-Compute Service.
  /// </li>
  /// </ul>
  /// If you set the context to <code>RESERVATIONS</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// AZ - The Availability Zone. An example is <code>us-east-1a</code>.
  /// </li>
  /// <li>
  /// CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are Windows
  /// or Linux.
  /// </li>
  /// <li>
  /// DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service
  /// deployments. Valid values are <code>SingleAZ</code> and
  /// <code>MultiAZ</code>.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE - The type of Amazon EC2 instance. An example is
  /// <code>m4.xlarge</code>.
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the full
  /// name of the member account. The value field contains the AWS ID of the
  /// member account.
  /// </li>
  /// <li>
  /// PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.
  /// </li>
  /// <li>
  /// REGION - The AWS Region.
  /// </li>
  /// <li>
  /// SCOPE (Utilization only) - The scope of a Reserved Instance (RI). Values are
  /// regional or a single Availability Zone.
  /// </li>
  /// <li>
  /// TAG (Coverage only) - The tags that are associated with a Reserved Instance
  /// (RI).
  /// </li>
  /// <li>
  /// TENANCY - The tenancy of a resource. Examples are shared or dedicated.
  /// </li>
  /// </ul>
  /// If you set the context to <code>SAVINGS_PLANS</code>, you can use the
  /// following dimensions for searching:
  ///
  /// <ul>
  /// <li>
  /// SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or Compute)
  /// </li>
  /// <li>
  /// PAYMENT_OPTION - Payment option for the given Savings Plans (for example,
  /// All Upfront)
  /// </li>
  /// <li>
  /// REGION - The AWS Region.
  /// </li>
  /// <li>
  /// INSTANCE_TYPE_FAMILY - The family of instances (For example,
  /// <code>m5</code>)
  /// </li>
  /// <li>
  /// LINKED_ACCOUNT - The description in the attribute map that includes the full
  /// name of the member account. The value field contains the AWS ID of the
  /// member account.
  /// </li>
  /// <li>
  /// SAVINGS_PLAN_ARN - The unique identifier for your Savings Plan
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DimensionValues')
  final List<DimensionValuesWithAttributes> dimensionValues;

  /// The number of results that AWS returned at one time.
  @_s.JsonKey(name: 'ReturnSize')
  final int returnSize;

  /// The total number of search results.
  @_s.JsonKey(name: 'TotalSize')
  final int totalSize;

  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  GetDimensionValuesResponse({
    @_s.required this.dimensionValues,
    @_s.required this.returnSize,
    @_s.required this.totalSize,
    this.nextPageToken,
  });
  factory GetDimensionValuesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDimensionValuesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetReservationCoverageResponse {
  /// The amount of time that your reservations covered.
  @_s.JsonKey(name: 'CoveragesByTime')
  final List<CoverageByTime> coveragesByTime;

  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// The total amount of instance usage that a reservation covered.
  @_s.JsonKey(name: 'Total')
  final Coverage total;

  GetReservationCoverageResponse({
    @_s.required this.coveragesByTime,
    this.nextPageToken,
    this.total,
  });
  factory GetReservationCoverageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReservationCoverageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetReservationPurchaseRecommendationResponse {
  /// Information about this specific recommendation call, such as the time stamp
  /// for when Cost Explorer generated this recommendation.
  @_s.JsonKey(name: 'Metadata')
  final ReservationPurchaseRecommendationMetadata metadata;

  /// The pagination token for the next set of retrievable results.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Recommendations for reservations to purchase.
  @_s.JsonKey(name: 'Recommendations')
  final List<ReservationPurchaseRecommendation> recommendations;

  GetReservationPurchaseRecommendationResponse({
    this.metadata,
    this.nextPageToken,
    this.recommendations,
  });
  factory GetReservationPurchaseRecommendationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetReservationPurchaseRecommendationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetReservationUtilizationResponse {
  /// The amount of time that you used your RIs.
  @_s.JsonKey(name: 'UtilizationsByTime')
  final List<UtilizationByTime> utilizationsByTime;

  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// The total amount of time that you used your RIs.
  @_s.JsonKey(name: 'Total')
  final ReservationAggregates total;

  GetReservationUtilizationResponse({
    @_s.required this.utilizationsByTime,
    this.nextPageToken,
    this.total,
  });
  factory GetReservationUtilizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetReservationUtilizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRightsizingRecommendationResponse {
  /// Information regarding this specific recommendation set.
  @_s.JsonKey(name: 'Metadata')
  final RightsizingRecommendationMetadata metadata;

  /// The token to retrieve the next set of results.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Recommendations to rightsize resources.
  @_s.JsonKey(name: 'RightsizingRecommendations')
  final List<RightsizingRecommendation> rightsizingRecommendations;

  /// Summary of this recommendation set.
  @_s.JsonKey(name: 'Summary')
  final RightsizingRecommendationSummary summary;

  GetRightsizingRecommendationResponse({
    this.metadata,
    this.nextPageToken,
    this.rightsizingRecommendations,
    this.summary,
  });
  factory GetRightsizingRecommendationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetRightsizingRecommendationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSavingsPlansCoverageResponse {
  /// The amount of spend that your Savings Plans covered.
  @_s.JsonKey(name: 'SavingsPlansCoverages')
  final List<SavingsPlansCoverage> savingsPlansCoverages;

  /// The token to retrieve the next set of results. Amazon Web Services provides
  /// the token when the response from a previous call has more results than the
  /// maximum page size.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetSavingsPlansCoverageResponse({
    @_s.required this.savingsPlansCoverages,
    this.nextToken,
  });
  factory GetSavingsPlansCoverageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSavingsPlansCoverageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSavingsPlansPurchaseRecommendationResponse {
  /// Information regarding this specific recommendation set.
  @_s.JsonKey(name: 'Metadata')
  final SavingsPlansPurchaseRecommendationMetadata metadata;

  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  /// Contains your request parameters, Savings Plan Recommendations Summary, and
  /// Details.
  @_s.JsonKey(name: 'SavingsPlansPurchaseRecommendation')
  final SavingsPlansPurchaseRecommendation savingsPlansPurchaseRecommendation;

  GetSavingsPlansPurchaseRecommendationResponse({
    this.metadata,
    this.nextPageToken,
    this.savingsPlansPurchaseRecommendation,
  });
  factory GetSavingsPlansPurchaseRecommendationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetSavingsPlansPurchaseRecommendationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSavingsPlansUtilizationDetailsResponse {
  /// Retrieves a single daily or monthly Savings Plans utilization rate and
  /// details for your account.
  @_s.JsonKey(name: 'SavingsPlansUtilizationDetails')
  final List<SavingsPlansUtilizationDetail> savingsPlansUtilizationDetails;
  @_s.JsonKey(name: 'TimePeriod')
  final DateInterval timePeriod;

  /// The token to retrieve the next set of results. Amazon Web Services provides
  /// the token when the response from a previous call has more results than the
  /// maximum page size.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The total Savings Plans utilization, regardless of time period.
  @_s.JsonKey(name: 'Total')
  final SavingsPlansUtilizationAggregates total;

  GetSavingsPlansUtilizationDetailsResponse({
    @_s.required this.savingsPlansUtilizationDetails,
    @_s.required this.timePeriod,
    this.nextToken,
    this.total,
  });
  factory GetSavingsPlansUtilizationDetailsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetSavingsPlansUtilizationDetailsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSavingsPlansUtilizationResponse {
  /// The total amount of cost/commitment that you used your Savings Plans,
  /// regardless of date ranges.
  @_s.JsonKey(name: 'Total')
  final SavingsPlansUtilizationAggregates total;

  /// The amount of cost/commitment you used your Savings Plans. This allows you
  /// to specify date ranges.
  @_s.JsonKey(name: 'SavingsPlansUtilizationsByTime')
  final List<SavingsPlansUtilizationByTime> savingsPlansUtilizationsByTime;

  GetSavingsPlansUtilizationResponse({
    @_s.required this.total,
    this.savingsPlansUtilizationsByTime,
  });
  factory GetSavingsPlansUtilizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetSavingsPlansUtilizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTagsResponse {
  /// The number of query results that AWS returns at a time.
  @_s.JsonKey(name: 'ReturnSize')
  final int returnSize;

  /// The tags that match your request.
  @_s.JsonKey(name: 'Tags')
  final List<String> tags;

  /// The total number of query results.
  @_s.JsonKey(name: 'TotalSize')
  final int totalSize;

  /// The token for the next set of retrievable results. AWS provides the token
  /// when the response from a previous call has more results than the maximum
  /// page size.
  @_s.JsonKey(name: 'NextPageToken')
  final String nextPageToken;

  GetTagsResponse({
    @_s.required this.returnSize,
    @_s.required this.tags,
    @_s.required this.totalSize,
    this.nextPageToken,
  });
  factory GetTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTagsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUsageForecastResponse {
  /// The forecasts for your query, in order. For <code>DAILY</code> forecasts,
  /// this is a list of days. For <code>MONTHLY</code> forecasts, this is a list
  /// of months.
  @_s.JsonKey(name: 'ForecastResultsByTime')
  final List<ForecastResult> forecastResultsByTime;

  /// How much you're forecasted to use over the forecast period.
  @_s.JsonKey(name: 'Total')
  final MetricValue total;

  GetUsageForecastResponse({
    this.forecastResultsByTime,
    this.total,
  });
  factory GetUsageForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsageForecastResponseFromJson(json);
}

enum Granularity {
  @_s.JsonValue('DAILY')
  daily,
  @_s.JsonValue('MONTHLY')
  monthly,
  @_s.JsonValue('HOURLY')
  hourly,
}

extension on Granularity {
  String toValue() {
    switch (this) {
      case Granularity.daily:
        return 'DAILY';
      case Granularity.monthly:
        return 'MONTHLY';
      case Granularity.hourly:
        return 'HOURLY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// One level of grouped data in the results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Group {
  /// The keys that are included in this group.
  @_s.JsonKey(name: 'Keys')
  final List<String> keys;

  /// The metrics that are included in this group.
  @_s.JsonKey(name: 'Metrics')
  final Map<String, MetricValue> metrics;

  Group({
    this.keys,
    this.metrics,
  });
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

/// Represents a group when you specify a group by criteria or in the response
/// to a query with a specific grouping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GroupDefinition {
  /// The string that represents a key for a specified group.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The string that represents the type of group.
  @_s.JsonKey(name: 'Type')
  final GroupDefinitionType type;

  GroupDefinition({
    this.key,
    this.type,
  });
  factory GroupDefinition.fromJson(Map<String, dynamic> json) =>
      _$GroupDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$GroupDefinitionToJson(this);
}

enum GroupDefinitionType {
  @_s.JsonValue('DIMENSION')
  dimension,
  @_s.JsonValue('TAG')
  tag,
  @_s.JsonValue('COST_CATEGORY')
  costCategory,
}

/// Details about the instances that AWS recommends that you purchase.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceDetails {
  /// The Amazon EC2 instances that AWS recommends that you purchase.
  @_s.JsonKey(name: 'EC2InstanceDetails')
  final EC2InstanceDetails eC2InstanceDetails;

  /// The Amazon ES instances that AWS recommends that you purchase.
  @_s.JsonKey(name: 'ESInstanceDetails')
  final ESInstanceDetails eSInstanceDetails;

  /// The ElastiCache instances that AWS recommends that you purchase.
  @_s.JsonKey(name: 'ElastiCacheInstanceDetails')
  final ElastiCacheInstanceDetails elastiCacheInstanceDetails;

  /// The Amazon RDS instances that AWS recommends that you purchase.
  @_s.JsonKey(name: 'RDSInstanceDetails')
  final RDSInstanceDetails rDSInstanceDetails;

  /// The Amazon Redshift instances that AWS recommends that you purchase.
  @_s.JsonKey(name: 'RedshiftInstanceDetails')
  final RedshiftInstanceDetails redshiftInstanceDetails;

  InstanceDetails({
    this.eC2InstanceDetails,
    this.eSInstanceDetails,
    this.elastiCacheInstanceDetails,
    this.rDSInstanceDetails,
    this.redshiftInstanceDetails,
  });
  factory InstanceDetails.fromJson(Map<String, dynamic> json) =>
      _$InstanceDetailsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCostCategoryDefinitionsResponse {
  /// A reference to a Cost Category containing enough information to identify the
  /// Cost Category.
  @_s.JsonKey(name: 'CostCategoryReferences')
  final List<CostCategoryReference> costCategoryReferences;

  /// The token to retrieve the next set of results. Amazon Web Services provides
  /// the token when the response from a previous call has more results than the
  /// maximum page size.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCostCategoryDefinitionsResponse({
    this.costCategoryReferences,
    this.nextToken,
  });
  factory ListCostCategoryDefinitionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListCostCategoryDefinitionsResponseFromJson(json);
}

enum LookbackPeriodInDays {
  @_s.JsonValue('SEVEN_DAYS')
  sevenDays,
  @_s.JsonValue('THIRTY_DAYS')
  thirtyDays,
  @_s.JsonValue('SIXTY_DAYS')
  sixtyDays,
}

extension on LookbackPeriodInDays {
  String toValue() {
    switch (this) {
      case LookbackPeriodInDays.sevenDays:
        return 'SEVEN_DAYS';
      case LookbackPeriodInDays.thirtyDays:
        return 'THIRTY_DAYS';
      case LookbackPeriodInDays.sixtyDays:
        return 'SIXTY_DAYS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum MatchOption {
  @_s.JsonValue('EQUALS')
  equals,
  @_s.JsonValue('STARTS_WITH')
  startsWith,
  @_s.JsonValue('ENDS_WITH')
  endsWith,
  @_s.JsonValue('CONTAINS')
  contains,
  @_s.JsonValue('CASE_SENSITIVE')
  caseSensitive,
  @_s.JsonValue('CASE_INSENSITIVE')
  caseInsensitive,
}

enum Metric {
  @_s.JsonValue('BLENDED_COST')
  blendedCost,
  @_s.JsonValue('UNBLENDED_COST')
  unblendedCost,
  @_s.JsonValue('AMORTIZED_COST')
  amortizedCost,
  @_s.JsonValue('NET_UNBLENDED_COST')
  netUnblendedCost,
  @_s.JsonValue('NET_AMORTIZED_COST')
  netAmortizedCost,
  @_s.JsonValue('USAGE_QUANTITY')
  usageQuantity,
  @_s.JsonValue('NORMALIZED_USAGE_AMOUNT')
  normalizedUsageAmount,
}

extension on Metric {
  String toValue() {
    switch (this) {
      case Metric.blendedCost:
        return 'BLENDED_COST';
      case Metric.unblendedCost:
        return 'UNBLENDED_COST';
      case Metric.amortizedCost:
        return 'AMORTIZED_COST';
      case Metric.netUnblendedCost:
        return 'NET_UNBLENDED_COST';
      case Metric.netAmortizedCost:
        return 'NET_AMORTIZED_COST';
      case Metric.usageQuantity:
        return 'USAGE_QUANTITY';
      case Metric.normalizedUsageAmount:
        return 'NORMALIZED_USAGE_AMOUNT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The aggregated value for a metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MetricValue {
  /// The actual number that represents the metric.
  @_s.JsonKey(name: 'Amount')
  final String amount;

  /// The unit that the metric is given in.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  MetricValue({
    this.amount,
    this.unit,
  });
  factory MetricValue.fromJson(Map<String, dynamic> json) =>
      _$MetricValueFromJson(json);
}

/// Details on the modification recommendation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModifyRecommendationDetail {
  /// Identifies whether this instance type is the Amazon Web Services default
  /// recommendation.
  @_s.JsonKey(name: 'TargetInstances')
  final List<TargetInstance> targetInstances;

  ModifyRecommendationDetail({
    this.targetInstances,
  });
  factory ModifyRecommendationDetail.fromJson(Map<String, dynamic> json) =>
      _$ModifyRecommendationDetailFromJson(json);
}

enum OfferingClass {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('CONVERTIBLE')
  convertible,
}

enum PaymentOption {
  @_s.JsonValue('NO_UPFRONT')
  noUpfront,
  @_s.JsonValue('PARTIAL_UPFRONT')
  partialUpfront,
  @_s.JsonValue('ALL_UPFRONT')
  allUpfront,
  @_s.JsonValue('LIGHT_UTILIZATION')
  lightUtilization,
  @_s.JsonValue('MEDIUM_UTILIZATION')
  mediumUtilization,
  @_s.JsonValue('HEAVY_UTILIZATION')
  heavyUtilization,
}

extension on PaymentOption {
  String toValue() {
    switch (this) {
      case PaymentOption.noUpfront:
        return 'NO_UPFRONT';
      case PaymentOption.partialUpfront:
        return 'PARTIAL_UPFRONT';
      case PaymentOption.allUpfront:
        return 'ALL_UPFRONT';
      case PaymentOption.lightUtilization:
        return 'LIGHT_UTILIZATION';
      case PaymentOption.mediumUtilization:
        return 'MEDIUM_UTILIZATION';
      case PaymentOption.heavyUtilization:
        return 'HEAVY_UTILIZATION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details about the Amazon RDS instances that AWS recommends that you
/// purchase.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RDSInstanceDetails {
  /// Whether the recommendation is for a current-generation instance.
  @_s.JsonKey(name: 'CurrentGeneration')
  final bool currentGeneration;

  /// The database edition that the recommended reservation supports.
  @_s.JsonKey(name: 'DatabaseEdition')
  final String databaseEdition;

  /// The database engine that the recommended reservation supports.
  @_s.JsonKey(name: 'DatabaseEngine')
  final String databaseEngine;

  /// Whether the recommendation is for a reservation in a single Availability
  /// Zone or a reservation with a backup in a second Availability Zone.
  @_s.JsonKey(name: 'DeploymentOption')
  final String deploymentOption;

  /// The instance family of the recommended reservation.
  @_s.JsonKey(name: 'Family')
  final String family;

  /// The type of instance that AWS recommends.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// The license model that the recommended reservation supports.
  @_s.JsonKey(name: 'LicenseModel')
  final String licenseModel;

  /// The AWS Region of the recommended reservation.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// Whether the recommended reservation is size flexible.
  @_s.JsonKey(name: 'SizeFlexEligible')
  final bool sizeFlexEligible;

  RDSInstanceDetails({
    this.currentGeneration,
    this.databaseEdition,
    this.databaseEngine,
    this.deploymentOption,
    this.family,
    this.instanceType,
    this.licenseModel,
    this.region,
    this.sizeFlexEligible,
  });
  factory RDSInstanceDetails.fromJson(Map<String, dynamic> json) =>
      _$RDSInstanceDetailsFromJson(json);
}

/// Details about the Amazon Redshift instances that AWS recommends that you
/// purchase.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RedshiftInstanceDetails {
  /// Whether the recommendation is for a current-generation instance.
  @_s.JsonKey(name: 'CurrentGeneration')
  final bool currentGeneration;

  /// The instance family of the recommended reservation.
  @_s.JsonKey(name: 'Family')
  final String family;

  /// The type of node that AWS recommends.
  @_s.JsonKey(name: 'NodeType')
  final String nodeType;

  /// The AWS Region of the recommended reservation.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// Whether the recommended reservation is size flexible.
  @_s.JsonKey(name: 'SizeFlexEligible')
  final bool sizeFlexEligible;

  RedshiftInstanceDetails({
    this.currentGeneration,
    this.family,
    this.nodeType,
    this.region,
    this.sizeFlexEligible,
  });
  factory RedshiftInstanceDetails.fromJson(Map<String, dynamic> json) =>
      _$RedshiftInstanceDetailsFromJson(json);
}

/// The aggregated numbers for your reservation usage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReservationAggregates {
  /// The monthly cost of your reservation, amortized over the reservation period.
  @_s.JsonKey(name: 'AmortizedRecurringFee')
  final String amortizedRecurringFee;

  /// The upfront cost of your reservation, amortized over the reservation period.
  @_s.JsonKey(name: 'AmortizedUpfrontFee')
  final String amortizedUpfrontFee;

  /// How much you saved due to purchasing and utilizing reservation. AWS
  /// calculates this by subtracting <code>TotalAmortizedFee</code> from
  /// <code>OnDemandCostOfRIHoursUsed</code>.
  @_s.JsonKey(name: 'NetRISavings')
  final String netRISavings;

  /// How much your reservation would cost if charged On-Demand rates.
  @_s.JsonKey(name: 'OnDemandCostOfRIHoursUsed')
  final String onDemandCostOfRIHoursUsed;

  /// How many reservation hours that you purchased.
  @_s.JsonKey(name: 'PurchasedHours')
  final String purchasedHours;

  /// How many Amazon EC2 reservation hours that you purchased, converted to
  /// normalized units. Normalized units are available only for Amazon EC2 usage
  /// after November 11, 2017.
  @_s.JsonKey(name: 'PurchasedUnits')
  final String purchasedUnits;

  /// The total number of reservation hours that you used.
  @_s.JsonKey(name: 'TotalActualHours')
  final String totalActualHours;

  /// The total number of Amazon EC2 reservation hours that you used, converted to
  /// normalized units. Normalized units are available only for Amazon EC2 usage
  /// after November 11, 2017.
  @_s.JsonKey(name: 'TotalActualUnits')
  final String totalActualUnits;

  /// The total cost of your reservation, amortized over the reservation period.
  @_s.JsonKey(name: 'TotalAmortizedFee')
  final String totalAmortizedFee;

  /// How much you could save if you use your entire reservation.
  @_s.JsonKey(name: 'TotalPotentialRISavings')
  final String totalPotentialRISavings;

  /// The number of reservation hours that you didn't use.
  @_s.JsonKey(name: 'UnusedHours')
  final String unusedHours;

  /// The number of Amazon EC2 reservation hours that you didn't use, converted to
  /// normalized units. Normalized units are available only for Amazon EC2 usage
  /// after November 11, 2017.
  @_s.JsonKey(name: 'UnusedUnits')
  final String unusedUnits;

  /// The percentage of reservation time that you used.
  @_s.JsonKey(name: 'UtilizationPercentage')
  final String utilizationPercentage;

  /// The percentage of Amazon EC2 reservation time that you used, converted to
  /// normalized units. Normalized units are available only for Amazon EC2 usage
  /// after November 11, 2017.
  @_s.JsonKey(name: 'UtilizationPercentageInUnits')
  final String utilizationPercentageInUnits;

  ReservationAggregates({
    this.amortizedRecurringFee,
    this.amortizedUpfrontFee,
    this.netRISavings,
    this.onDemandCostOfRIHoursUsed,
    this.purchasedHours,
    this.purchasedUnits,
    this.totalActualHours,
    this.totalActualUnits,
    this.totalAmortizedFee,
    this.totalPotentialRISavings,
    this.unusedHours,
    this.unusedUnits,
    this.utilizationPercentage,
    this.utilizationPercentageInUnits,
  });
  factory ReservationAggregates.fromJson(Map<String, dynamic> json) =>
      _$ReservationAggregatesFromJson(json);
}

/// A group of reservations that share a set of attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReservationCoverageGroup {
  /// The attributes for this group of reservations.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// How much instance usage this group of reservations covered.
  @_s.JsonKey(name: 'Coverage')
  final Coverage coverage;

  ReservationCoverageGroup({
    this.attributes,
    this.coverage,
  });
  factory ReservationCoverageGroup.fromJson(Map<String, dynamic> json) =>
      _$ReservationCoverageGroupFromJson(json);
}

/// A specific reservation that AWS recommends for purchase.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReservationPurchaseRecommendation {
  /// The account scope that AWS recommends that you purchase this instance for.
  /// For example, you can purchase this reservation for an entire organization in
  /// AWS Organizations.
  @_s.JsonKey(name: 'AccountScope')
  final AccountScope accountScope;

  /// How many days of previous usage that AWS considers when making this
  /// recommendation.
  @_s.JsonKey(name: 'LookbackPeriodInDays')
  final LookbackPeriodInDays lookbackPeriodInDays;

  /// The payment option for the reservation. For example, <code>AllUpfront</code>
  /// or <code>NoUpfront</code>.
  @_s.JsonKey(name: 'PaymentOption')
  final PaymentOption paymentOption;

  /// Details about the recommended purchases.
  @_s.JsonKey(name: 'RecommendationDetails')
  final List<ReservationPurchaseRecommendationDetail> recommendationDetails;

  /// A summary about the recommended purchase.
  @_s.JsonKey(name: 'RecommendationSummary')
  final ReservationPurchaseRecommendationSummary recommendationSummary;

  /// Hardware specifications for the service that you want recommendations for.
  @_s.JsonKey(name: 'ServiceSpecification')
  final ServiceSpecification serviceSpecification;

  /// The term of the reservation that you want recommendations for, in years.
  @_s.JsonKey(name: 'TermInYears')
  final TermInYears termInYears;

  ReservationPurchaseRecommendation({
    this.accountScope,
    this.lookbackPeriodInDays,
    this.paymentOption,
    this.recommendationDetails,
    this.recommendationSummary,
    this.serviceSpecification,
    this.termInYears,
  });
  factory ReservationPurchaseRecommendation.fromJson(
          Map<String, dynamic> json) =>
      _$ReservationPurchaseRecommendationFromJson(json);
}

/// Details about your recommended reservation purchase.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReservationPurchaseRecommendationDetail {
  /// The account that this RI recommendation is for.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The average number of normalized units that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  @_s.JsonKey(name: 'AverageNormalizedUnitsUsedPerHour')
  final String averageNormalizedUnitsUsedPerHour;

  /// The average number of instances that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  @_s.JsonKey(name: 'AverageNumberOfInstancesUsedPerHour')
  final String averageNumberOfInstancesUsedPerHour;

  /// The average utilization of your instances. AWS uses this to calculate your
  /// recommended reservation purchases.
  @_s.JsonKey(name: 'AverageUtilization')
  final String averageUtilization;

  /// The currency code that AWS used to calculate the costs for this instance.
  @_s.JsonKey(name: 'CurrencyCode')
  final String currencyCode;

  /// How long AWS estimates that it takes for this instance to start saving you
  /// money, in months.
  @_s.JsonKey(name: 'EstimatedBreakEvenInMonths')
  final String estimatedBreakEvenInMonths;

  /// How much AWS estimates that you spend on On-Demand Instances in a month.
  @_s.JsonKey(name: 'EstimatedMonthlyOnDemandCost')
  final String estimatedMonthlyOnDemandCost;

  /// How much AWS estimates that this specific recommendation could save you in a
  /// month.
  @_s.JsonKey(name: 'EstimatedMonthlySavingsAmount')
  final String estimatedMonthlySavingsAmount;

  /// How much AWS estimates that this specific recommendation could save you in a
  /// month, as a percentage of your overall costs.
  @_s.JsonKey(name: 'EstimatedMonthlySavingsPercentage')
  final String estimatedMonthlySavingsPercentage;

  /// How much AWS estimates that you would have spent for all usage during the
  /// specified historical period if you had a reservation.
  @_s.JsonKey(name: 'EstimatedReservationCostForLookbackPeriod')
  final String estimatedReservationCostForLookbackPeriod;

  /// Details about the instances that AWS recommends that you purchase.
  @_s.JsonKey(name: 'InstanceDetails')
  final InstanceDetails instanceDetails;

  /// The maximum number of normalized units that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  @_s.JsonKey(name: 'MaximumNormalizedUnitsUsedPerHour')
  final String maximumNormalizedUnitsUsedPerHour;

  /// The maximum number of instances that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  @_s.JsonKey(name: 'MaximumNumberOfInstancesUsedPerHour')
  final String maximumNumberOfInstancesUsedPerHour;

  /// The minimum number of normalized units that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  @_s.JsonKey(name: 'MinimumNormalizedUnitsUsedPerHour')
  final String minimumNormalizedUnitsUsedPerHour;

  /// The minimum number of instances that you used in an hour during the
  /// historical period. AWS uses this to calculate your recommended reservation
  /// purchases.
  @_s.JsonKey(name: 'MinimumNumberOfInstancesUsedPerHour')
  final String minimumNumberOfInstancesUsedPerHour;

  /// The number of normalized units that AWS recommends that you purchase.
  @_s.JsonKey(name: 'RecommendedNormalizedUnitsToPurchase')
  final String recommendedNormalizedUnitsToPurchase;

  /// The number of instances that AWS recommends that you purchase.
  @_s.JsonKey(name: 'RecommendedNumberOfInstancesToPurchase')
  final String recommendedNumberOfInstancesToPurchase;

  /// How much purchasing this instance costs you on a monthly basis.
  @_s.JsonKey(name: 'RecurringStandardMonthlyCost')
  final String recurringStandardMonthlyCost;

  /// How much purchasing this instance costs you upfront.
  @_s.JsonKey(name: 'UpfrontCost')
  final String upfrontCost;

  ReservationPurchaseRecommendationDetail({
    this.accountId,
    this.averageNormalizedUnitsUsedPerHour,
    this.averageNumberOfInstancesUsedPerHour,
    this.averageUtilization,
    this.currencyCode,
    this.estimatedBreakEvenInMonths,
    this.estimatedMonthlyOnDemandCost,
    this.estimatedMonthlySavingsAmount,
    this.estimatedMonthlySavingsPercentage,
    this.estimatedReservationCostForLookbackPeriod,
    this.instanceDetails,
    this.maximumNormalizedUnitsUsedPerHour,
    this.maximumNumberOfInstancesUsedPerHour,
    this.minimumNormalizedUnitsUsedPerHour,
    this.minimumNumberOfInstancesUsedPerHour,
    this.recommendedNormalizedUnitsToPurchase,
    this.recommendedNumberOfInstancesToPurchase,
    this.recurringStandardMonthlyCost,
    this.upfrontCost,
  });
  factory ReservationPurchaseRecommendationDetail.fromJson(
          Map<String, dynamic> json) =>
      _$ReservationPurchaseRecommendationDetailFromJson(json);
}

/// Information about this specific recommendation, such as the timestamp for
/// when AWS made a specific recommendation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReservationPurchaseRecommendationMetadata {
  /// The timestamp for when AWS made this recommendation.
  @_s.JsonKey(name: 'GenerationTimestamp')
  final String generationTimestamp;

  /// The ID for this specific recommendation.
  @_s.JsonKey(name: 'RecommendationId')
  final String recommendationId;

  ReservationPurchaseRecommendationMetadata({
    this.generationTimestamp,
    this.recommendationId,
  });
  factory ReservationPurchaseRecommendationMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$ReservationPurchaseRecommendationMetadataFromJson(json);
}

/// A summary about this recommendation, such as the currency code, the amount
/// that AWS estimates that you could save, and the total amount of reservation
/// to purchase.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReservationPurchaseRecommendationSummary {
  /// The currency code used for this recommendation.
  @_s.JsonKey(name: 'CurrencyCode')
  final String currencyCode;

  /// The total amount that AWS estimates that this recommendation could save you
  /// in a month.
  @_s.JsonKey(name: 'TotalEstimatedMonthlySavingsAmount')
  final String totalEstimatedMonthlySavingsAmount;

  /// The total amount that AWS estimates that this recommendation could save you
  /// in a month, as a percentage of your costs.
  @_s.JsonKey(name: 'TotalEstimatedMonthlySavingsPercentage')
  final String totalEstimatedMonthlySavingsPercentage;

  ReservationPurchaseRecommendationSummary({
    this.currencyCode,
    this.totalEstimatedMonthlySavingsAmount,
    this.totalEstimatedMonthlySavingsPercentage,
  });
  factory ReservationPurchaseRecommendationSummary.fromJson(
          Map<String, dynamic> json) =>
      _$ReservationPurchaseRecommendationSummaryFromJson(json);
}

/// A group of reservations that share a set of attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReservationUtilizationGroup {
  /// The attributes for this group of reservations.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// The key for a specific reservation attribute.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// How much you used this group of reservations.
  @_s.JsonKey(name: 'Utilization')
  final ReservationAggregates utilization;

  /// The value of a specific reservation attribute.
  @_s.JsonKey(name: 'Value')
  final String value;

  ReservationUtilizationGroup({
    this.attributes,
    this.key,
    this.utilization,
    this.value,
  });
  factory ReservationUtilizationGroup.fromJson(Map<String, dynamic> json) =>
      _$ReservationUtilizationGroupFromJson(json);
}

/// Details on the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceDetails {
  /// Details on the Amazon EC2 resource.
  @_s.JsonKey(name: 'EC2ResourceDetails')
  final EC2ResourceDetails eC2ResourceDetails;

  ResourceDetails({
    this.eC2ResourceDetails,
  });
  factory ResourceDetails.fromJson(Map<String, dynamic> json) =>
      _$ResourceDetailsFromJson(json);
}

/// Resource utilization of current resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceUtilization {
  /// Utilization of current Amazon EC2 Instance
  @_s.JsonKey(name: 'EC2ResourceUtilization')
  final EC2ResourceUtilization eC2ResourceUtilization;

  ResourceUtilization({
    this.eC2ResourceUtilization,
  });
  factory ResourceUtilization.fromJson(Map<String, dynamic> json) =>
      _$ResourceUtilizationFromJson(json);
}

/// The result that is associated with a time period.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResultByTime {
  /// Whether the result is estimated.
  @_s.JsonKey(name: 'Estimated')
  final bool estimated;

  /// The groups that this time period includes.
  @_s.JsonKey(name: 'Groups')
  final List<Group> groups;

  /// The time period that the result covers.
  @_s.JsonKey(name: 'TimePeriod')
  final DateInterval timePeriod;

  /// The total amount of cost or usage accrued during the time period.
  @_s.JsonKey(name: 'Total')
  final Map<String, MetricValue> total;

  ResultByTime({
    this.estimated,
    this.groups,
    this.timePeriod,
    this.total,
  });
  factory ResultByTime.fromJson(Map<String, dynamic> json) =>
      _$ResultByTimeFromJson(json);
}

/// Recommendations to rightsize resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RightsizingRecommendation {
  /// The account that this recommendation is for.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// Context regarding the current instance.
  @_s.JsonKey(name: 'CurrentInstance')
  final CurrentInstance currentInstance;

  /// Details for modification recommendations.
  @_s.JsonKey(name: 'ModifyRecommendationDetail')
  final ModifyRecommendationDetail modifyRecommendationDetail;

  /// Recommendation to either terminate or modify the resource.
  @_s.JsonKey(name: 'RightsizingType')
  final RightsizingType rightsizingType;

  /// Details for termination recommendations.
  @_s.JsonKey(name: 'TerminateRecommendationDetail')
  final TerminateRecommendationDetail terminateRecommendationDetail;

  RightsizingRecommendation({
    this.accountId,
    this.currentInstance,
    this.modifyRecommendationDetail,
    this.rightsizingType,
    this.terminateRecommendationDetail,
  });
  factory RightsizingRecommendation.fromJson(Map<String, dynamic> json) =>
      _$RightsizingRecommendationFromJson(json);
}

/// Metadata for this recommendation set.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RightsizingRecommendationMetadata {
  /// The time stamp for when Amazon Web Services made this recommendation.
  @_s.JsonKey(name: 'GenerationTimestamp')
  final String generationTimestamp;

  /// How many days of previous usage that Amazon Web Services considers when
  /// making this recommendation.
  @_s.JsonKey(name: 'LookbackPeriodInDays')
  final LookbackPeriodInDays lookbackPeriodInDays;

  /// The ID for this specific recommendation.
  @_s.JsonKey(name: 'RecommendationId')
  final String recommendationId;

  RightsizingRecommendationMetadata({
    this.generationTimestamp,
    this.lookbackPeriodInDays,
    this.recommendationId,
  });
  factory RightsizingRecommendationMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$RightsizingRecommendationMetadataFromJson(json);
}

/// Summary of rightsizing recommendations
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RightsizingRecommendationSummary {
  /// Estimated total savings resulting from modifications, on a monthly basis.
  @_s.JsonKey(name: 'EstimatedTotalMonthlySavingsAmount')
  final String estimatedTotalMonthlySavingsAmount;

  /// The currency code that Amazon Web Services used to calculate the savings.
  @_s.JsonKey(name: 'SavingsCurrencyCode')
  final String savingsCurrencyCode;

  /// Savings percentage based on the recommended modifications, relative to the
  /// total On Demand costs associated with these instances.
  @_s.JsonKey(name: 'SavingsPercentage')
  final String savingsPercentage;

  /// Total number of instance recommendations.
  @_s.JsonKey(name: 'TotalRecommendationCount')
  final String totalRecommendationCount;

  RightsizingRecommendationSummary({
    this.estimatedTotalMonthlySavingsAmount,
    this.savingsCurrencyCode,
    this.savingsPercentage,
    this.totalRecommendationCount,
  });
  factory RightsizingRecommendationSummary.fromJson(
          Map<String, dynamic> json) =>
      _$RightsizingRecommendationSummaryFromJson(json);
}

enum RightsizingType {
  @_s.JsonValue('TERMINATE')
  terminate,
  @_s.JsonValue('MODIFY')
  modify,
}

/// The amortized amount of Savings Plans purchased in a specific account during
/// a specific time interval.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansAmortizedCommitment {
  /// The amortized amount of your Savings Plans commitment that was purchased
  /// with either a <code>Partial</code> or a <code>NoUpfront</code>.
  @_s.JsonKey(name: 'AmortizedRecurringCommitment')
  final String amortizedRecurringCommitment;

  /// The amortized amount of your Savings Plans commitment that was purchased
  /// with an <code>Upfront</code> or <code>PartialUpfront</code> Savings Plans.
  @_s.JsonKey(name: 'AmortizedUpfrontCommitment')
  final String amortizedUpfrontCommitment;

  /// The total amortized amount of your Savings Plans commitment, regardless of
  /// your Savings Plans purchase method.
  @_s.JsonKey(name: 'TotalAmortizedCommitment')
  final String totalAmortizedCommitment;

  SavingsPlansAmortizedCommitment({
    this.amortizedRecurringCommitment,
    this.amortizedUpfrontCommitment,
    this.totalAmortizedCommitment,
  });
  factory SavingsPlansAmortizedCommitment.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlansAmortizedCommitmentFromJson(json);
}

/// The amount of Savings Plans eligible usage that is covered by Savings Plans.
/// All calculations consider the On-Demand equivalent of your Savings Plans
/// usage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansCoverage {
  /// The attribute that applies to a specific <code>Dimension</code>.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// The amount of Savings Plans eligible usage that the Savings Plans covered.
  @_s.JsonKey(name: 'Coverage')
  final SavingsPlansCoverageData coverage;
  @_s.JsonKey(name: 'TimePeriod')
  final DateInterval timePeriod;

  SavingsPlansCoverage({
    this.attributes,
    this.coverage,
    this.timePeriod,
  });
  factory SavingsPlansCoverage.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlansCoverageFromJson(json);
}

/// Specific coverage percentage, On-Demand costs, and spend covered by Savings
/// Plans, and total Savings Plans costs for an account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansCoverageData {
  /// The percentage of your existing Savings Plans covered usage, divided by all
  /// of your eligible Savings Plans usage in an account(or set of accounts).
  @_s.JsonKey(name: 'CoveragePercentage')
  final String coveragePercentage;

  /// The cost of your Amazon Web Services usage at the public On-Demand rate.
  @_s.JsonKey(name: 'OnDemandCost')
  final String onDemandCost;

  /// The amount of your Amazon Web Services usage that is covered by a Savings
  /// Plans.
  @_s.JsonKey(name: 'SpendCoveredBySavingsPlans')
  final String spendCoveredBySavingsPlans;

  /// The total cost of your Amazon Web Services usage, regardless of your
  /// purchase option.
  @_s.JsonKey(name: 'TotalCost')
  final String totalCost;

  SavingsPlansCoverageData({
    this.coveragePercentage,
    this.onDemandCost,
    this.spendCoveredBySavingsPlans,
    this.totalCost,
  });
  factory SavingsPlansCoverageData.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlansCoverageDataFromJson(json);
}

/// Attribute details on a specific Savings Plan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansDetails {
  /// A group of instance types that Savings Plans applies to.
  @_s.JsonKey(name: 'InstanceFamily')
  final String instanceFamily;

  /// The unique ID used to distinguish Savings Plans from one another.
  @_s.JsonKey(name: 'OfferingId')
  final String offeringId;

  /// A collection of AWS resources in a geographic area. Each AWS Region is
  /// isolated and independent of the other Regions.
  @_s.JsonKey(name: 'Region')
  final String region;

  SavingsPlansDetails({
    this.instanceFamily,
    this.offeringId,
    this.region,
  });
  factory SavingsPlansDetails.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlansDetailsFromJson(json);
}

/// Contains your request parameters, Savings Plan Recommendations Summary, and
/// Details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansPurchaseRecommendation {
  /// The account scope that you want your recommendations for. Amazon Web
  /// Services calculates recommendations including the payer account and linked
  /// accounts if the value is set to <code>PAYER</code>. If the value is
  /// <code>LINKED</code>, recommendations are calculated for individual linked
  /// accounts only.
  @_s.JsonKey(name: 'AccountScope')
  final AccountScope accountScope;

  /// The lookback period in days, used to generate the recommendation.
  @_s.JsonKey(name: 'LookbackPeriodInDays')
  final LookbackPeriodInDays lookbackPeriodInDays;

  /// The payment option used to generate the recommendation.
  @_s.JsonKey(name: 'PaymentOption')
  final PaymentOption paymentOption;

  /// Details for the Savings Plans we recommend that you purchase to cover
  /// existing Savings Plans eligible workloads.
  @_s.JsonKey(name: 'SavingsPlansPurchaseRecommendationDetails')
  final List<SavingsPlansPurchaseRecommendationDetail>
      savingsPlansPurchaseRecommendationDetails;

  /// Summary metrics for your Savings Plans Recommendations.
  @_s.JsonKey(name: 'SavingsPlansPurchaseRecommendationSummary')
  final SavingsPlansPurchaseRecommendationSummary
      savingsPlansPurchaseRecommendationSummary;

  /// The requested Savings Plans recommendation type.
  @_s.JsonKey(name: 'SavingsPlansType')
  final SupportedSavingsPlansType savingsPlansType;

  /// The Savings Plans recommendation term in years, used to generate the
  /// recommendation.
  @_s.JsonKey(name: 'TermInYears')
  final TermInYears termInYears;

  SavingsPlansPurchaseRecommendation({
    this.accountScope,
    this.lookbackPeriodInDays,
    this.paymentOption,
    this.savingsPlansPurchaseRecommendationDetails,
    this.savingsPlansPurchaseRecommendationSummary,
    this.savingsPlansType,
    this.termInYears,
  });
  factory SavingsPlansPurchaseRecommendation.fromJson(
          Map<String, dynamic> json) =>
      _$SavingsPlansPurchaseRecommendationFromJson(json);
}

/// Details for your recommended Savings Plans.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansPurchaseRecommendationDetail {
  /// The <code>AccountID</code> the recommendation is generated for.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The currency code Amazon Web Services used to generate the recommendations
  /// and present potential savings.
  @_s.JsonKey(name: 'CurrencyCode')
  final String currencyCode;

  /// The average value of hourly On-Demand spend over the lookback period of the
  /// applicable usage type.
  @_s.JsonKey(name: 'CurrentAverageHourlyOnDemandSpend')
  final String currentAverageHourlyOnDemandSpend;

  /// The highest value of hourly On-Demand spend over the lookback period of the
  /// applicable usage type.
  @_s.JsonKey(name: 'CurrentMaximumHourlyOnDemandSpend')
  final String currentMaximumHourlyOnDemandSpend;

  /// The lowest value of hourly On-Demand spend over the lookback period of the
  /// applicable usage type.
  @_s.JsonKey(name: 'CurrentMinimumHourlyOnDemandSpend')
  final String currentMinimumHourlyOnDemandSpend;

  /// The estimated utilization of the recommended Savings Plans.
  @_s.JsonKey(name: 'EstimatedAverageUtilization')
  final String estimatedAverageUtilization;

  /// The estimated monthly savings amount, based on the recommended Savings
  /// Plans.
  @_s.JsonKey(name: 'EstimatedMonthlySavingsAmount')
  final String estimatedMonthlySavingsAmount;

  /// The remaining On-Demand cost estimated to not be covered by the recommended
  /// Savings Plans, over the length of the lookback period.
  @_s.JsonKey(name: 'EstimatedOnDemandCost')
  final String estimatedOnDemandCost;

  /// The estimated On-Demand costs you would expect with no additional
  /// commitment, based on your usage of the selected time period and the Savings
  /// Plans you own.
  @_s.JsonKey(name: 'EstimatedOnDemandCostWithCurrentCommitment')
  final String estimatedOnDemandCostWithCurrentCommitment;

  /// The estimated return on investment based on the recommended Savings Plans
  /// purchased. This is calculated as <code>estimatedSavingsAmount</code>/
  /// <code>estimatedSPCost</code>*100.
  @_s.JsonKey(name: 'EstimatedROI')
  final String estimatedROI;

  /// The cost of the recommended Savings Plans over the length of the lookback
  /// period.
  @_s.JsonKey(name: 'EstimatedSPCost')
  final String estimatedSPCost;

  /// The estimated savings amount based on the recommended Savings Plans over the
  /// length of the lookback period.
  @_s.JsonKey(name: 'EstimatedSavingsAmount')
  final String estimatedSavingsAmount;

  /// The estimated savings percentage relative to the total cost of applicable
  /// On-Demand usage over the lookback period.
  @_s.JsonKey(name: 'EstimatedSavingsPercentage')
  final String estimatedSavingsPercentage;

  /// The recommended hourly commitment level for the Savings Plans type, and
  /// configuration based on the usage during the lookback period.
  @_s.JsonKey(name: 'HourlyCommitmentToPurchase')
  final String hourlyCommitmentToPurchase;

  /// Details for your recommended Savings Plans.
  @_s.JsonKey(name: 'SavingsPlansDetails')
  final SavingsPlansDetails savingsPlansDetails;

  /// The upfront cost of the recommended Savings Plans, based on the selected
  /// payment option.
  @_s.JsonKey(name: 'UpfrontCost')
  final String upfrontCost;

  SavingsPlansPurchaseRecommendationDetail({
    this.accountId,
    this.currencyCode,
    this.currentAverageHourlyOnDemandSpend,
    this.currentMaximumHourlyOnDemandSpend,
    this.currentMinimumHourlyOnDemandSpend,
    this.estimatedAverageUtilization,
    this.estimatedMonthlySavingsAmount,
    this.estimatedOnDemandCost,
    this.estimatedOnDemandCostWithCurrentCommitment,
    this.estimatedROI,
    this.estimatedSPCost,
    this.estimatedSavingsAmount,
    this.estimatedSavingsPercentage,
    this.hourlyCommitmentToPurchase,
    this.savingsPlansDetails,
    this.upfrontCost,
  });
  factory SavingsPlansPurchaseRecommendationDetail.fromJson(
          Map<String, dynamic> json) =>
      _$SavingsPlansPurchaseRecommendationDetailFromJson(json);
}

/// Metadata about your Savings Plans Purchase Recommendations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansPurchaseRecommendationMetadata {
  /// The timestamp showing when the recommendations were generated.
  @_s.JsonKey(name: 'GenerationTimestamp')
  final String generationTimestamp;

  /// The unique identifier for the recommendation set.
  @_s.JsonKey(name: 'RecommendationId')
  final String recommendationId;

  SavingsPlansPurchaseRecommendationMetadata({
    this.generationTimestamp,
    this.recommendationId,
  });
  factory SavingsPlansPurchaseRecommendationMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$SavingsPlansPurchaseRecommendationMetadataFromJson(json);
}

/// Summary metrics for your Savings Plans Purchase Recommendations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansPurchaseRecommendationSummary {
  /// The currency code Amazon Web Services used to generate the recommendations
  /// and present potential savings.
  @_s.JsonKey(name: 'CurrencyCode')
  final String currencyCode;

  /// The current total on demand spend of the applicable usage types over the
  /// lookback period.
  @_s.JsonKey(name: 'CurrentOnDemandSpend')
  final String currentOnDemandSpend;

  /// The recommended Savings Plans cost on a daily (24 hourly) basis.
  @_s.JsonKey(name: 'DailyCommitmentToPurchase')
  final String dailyCommitmentToPurchase;

  /// The estimated monthly savings amount, based on the recommended Savings Plans
  /// purchase.
  @_s.JsonKey(name: 'EstimatedMonthlySavingsAmount')
  final String estimatedMonthlySavingsAmount;

  /// The estimated On-Demand costs you would expect with no additional
  /// commitment, based on your usage of the selected time period and the Savings
  /// Plans you own.
  @_s.JsonKey(name: 'EstimatedOnDemandCostWithCurrentCommitment')
  final String estimatedOnDemandCostWithCurrentCommitment;

  /// The estimated return on investment based on the recommended Savings Plans
  /// and estimated savings.
  @_s.JsonKey(name: 'EstimatedROI')
  final String estimatedROI;

  /// The estimated total savings over the lookback period, based on the purchase
  /// of the recommended Savings Plans.
  @_s.JsonKey(name: 'EstimatedSavingsAmount')
  final String estimatedSavingsAmount;

  /// The estimated savings relative to the total cost of On-Demand usage, over
  /// the lookback period. This is calculated as
  /// <code>estimatedSavingsAmount</code>/ <code>CurrentOnDemandSpend</code>*100.
  @_s.JsonKey(name: 'EstimatedSavingsPercentage')
  final String estimatedSavingsPercentage;

  /// The estimated total cost of the usage after purchasing the recommended
  /// Savings Plans. This is a sum of the cost of Savings Plans during this term,
  /// and the remaining On-Demand usage.
  @_s.JsonKey(name: 'EstimatedTotalCost')
  final String estimatedTotalCost;

  /// The recommended hourly commitment based on the recommendation parameters.
  @_s.JsonKey(name: 'HourlyCommitmentToPurchase')
  final String hourlyCommitmentToPurchase;

  /// The aggregate number of Savings Plans recommendations that exist for your
  /// account.
  @_s.JsonKey(name: 'TotalRecommendationCount')
  final String totalRecommendationCount;

  SavingsPlansPurchaseRecommendationSummary({
    this.currencyCode,
    this.currentOnDemandSpend,
    this.dailyCommitmentToPurchase,
    this.estimatedMonthlySavingsAmount,
    this.estimatedOnDemandCostWithCurrentCommitment,
    this.estimatedROI,
    this.estimatedSavingsAmount,
    this.estimatedSavingsPercentage,
    this.estimatedTotalCost,
    this.hourlyCommitmentToPurchase,
    this.totalRecommendationCount,
  });
  factory SavingsPlansPurchaseRecommendationSummary.fromJson(
          Map<String, dynamic> json) =>
      _$SavingsPlansPurchaseRecommendationSummaryFromJson(json);
}

/// The amount of savings you're accumulating, against the public On-Demand rate
/// of the usage accrued in an account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansSavings {
  /// The savings amount that you are accumulating for the usage that is covered
  /// by a Savings Plans, when compared to the On-Demand equivalent of the same
  /// usage.
  @_s.JsonKey(name: 'NetSavings')
  final String netSavings;

  /// How much the amount that the usage would have cost if it was accrued at the
  /// On-Demand rate.
  @_s.JsonKey(name: 'OnDemandCostEquivalent')
  final String onDemandCostEquivalent;

  SavingsPlansSavings({
    this.netSavings,
    this.onDemandCostEquivalent,
  });
  factory SavingsPlansSavings.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlansSavingsFromJson(json);
}

/// The measurement of how well you are using your existing Savings Plans.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansUtilization {
  /// The total amount of Savings Plans commitment that's been purchased in an
  /// account (or set of accounts).
  @_s.JsonKey(name: 'TotalCommitment')
  final String totalCommitment;

  /// The amount of your Savings Plans commitment that was not consumed from
  /// Savings Plans eligible usage in a specific period.
  @_s.JsonKey(name: 'UnusedCommitment')
  final String unusedCommitment;

  /// The amount of your Savings Plans commitment that was consumed from Savings
  /// Plans eligible usage in a specific period.
  @_s.JsonKey(name: 'UsedCommitment')
  final String usedCommitment;

  /// The amount of <code>UsedCommitment</code> divided by the
  /// <code>TotalCommitment</code> for your Savings Plans.
  @_s.JsonKey(name: 'UtilizationPercentage')
  final String utilizationPercentage;

  SavingsPlansUtilization({
    this.totalCommitment,
    this.unusedCommitment,
    this.usedCommitment,
    this.utilizationPercentage,
  });
  factory SavingsPlansUtilization.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlansUtilizationFromJson(json);
}

/// The aggregated utilization metrics for your Savings Plans usage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansUtilizationAggregates {
  /// A ratio of your effectiveness of using existing Savings Plans to apply to
  /// workloads that are Savings Plans eligible.
  @_s.JsonKey(name: 'Utilization')
  final SavingsPlansUtilization utilization;

  /// The total amortized commitment for a Savings Plans. This includes the sum of
  /// the upfront and recurring Savings Plans fees.
  @_s.JsonKey(name: 'AmortizedCommitment')
  final SavingsPlansAmortizedCommitment amortizedCommitment;

  /// The amount saved by using existing Savings Plans. Savings returns both net
  /// savings from Savings Plans, as well as the
  /// <code>onDemandCostEquivalent</code> of the Savings Plans when considering
  /// the utilization rate.
  @_s.JsonKey(name: 'Savings')
  final SavingsPlansSavings savings;

  SavingsPlansUtilizationAggregates({
    @_s.required this.utilization,
    this.amortizedCommitment,
    this.savings,
  });
  factory SavingsPlansUtilizationAggregates.fromJson(
          Map<String, dynamic> json) =>
      _$SavingsPlansUtilizationAggregatesFromJson(json);
}

/// The amount of Savings Plans utilization, in hours.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansUtilizationByTime {
  @_s.JsonKey(name: 'TimePeriod')
  final DateInterval timePeriod;

  /// A ratio of your effectiveness of using existing Savings Plans to apply to
  /// workloads that are Savings Plans eligible.
  @_s.JsonKey(name: 'Utilization')
  final SavingsPlansUtilization utilization;

  /// The total amortized commitment for a Savings Plans. This includes the sum of
  /// the upfront and recurring Savings Plans fees.
  @_s.JsonKey(name: 'AmortizedCommitment')
  final SavingsPlansAmortizedCommitment amortizedCommitment;

  /// The amount saved by using existing Savings Plans. Savings returns both net
  /// savings from Savings Plans as well as the
  /// <code>onDemandCostEquivalent</code> of the Savings Plans when considering
  /// the utilization rate.
  @_s.JsonKey(name: 'Savings')
  final SavingsPlansSavings savings;

  SavingsPlansUtilizationByTime({
    @_s.required this.timePeriod,
    @_s.required this.utilization,
    this.amortizedCommitment,
    this.savings,
  });
  factory SavingsPlansUtilizationByTime.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlansUtilizationByTimeFromJson(json);
}

/// A single daily or monthly Savings Plans utilization rate, and details for
/// your account. Master accounts in an organization have access to member
/// accounts. You can use <code>GetDimensionValues</code> to determine the
/// possible dimension values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SavingsPlansUtilizationDetail {
  /// The total amortized commitment for a Savings Plans. Includes the sum of the
  /// upfront and recurring Savings Plans fees.
  @_s.JsonKey(name: 'AmortizedCommitment')
  final SavingsPlansAmortizedCommitment amortizedCommitment;

  /// The attribute that applies to a specific <code>Dimension</code>.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// The amount saved by using existing Savings Plans. Savings returns both net
  /// savings from savings plans as well as the
  /// <code>onDemandCostEquivalent</code> of the Savings Plans when considering
  /// the utilization rate.
  @_s.JsonKey(name: 'Savings')
  final SavingsPlansSavings savings;

  /// The unique Amazon Resource Name (ARN) for a particular Savings Plan.
  @_s.JsonKey(name: 'SavingsPlanArn')
  final String savingsPlanArn;

  /// A ratio of your effectiveness of using existing Savings Plans to apply to
  /// workloads that are Savings Plans eligible.
  @_s.JsonKey(name: 'Utilization')
  final SavingsPlansUtilization utilization;

  SavingsPlansUtilizationDetail({
    this.amortizedCommitment,
    this.attributes,
    this.savings,
    this.savingsPlanArn,
    this.utilization,
  });
  factory SavingsPlansUtilizationDetail.fromJson(Map<String, dynamic> json) =>
      _$SavingsPlansUtilizationDetailFromJson(json);
}

/// Hardware specifications for the service that you want recommendations for.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceSpecification {
  /// The Amazon EC2 hardware specifications that you want AWS to provide
  /// recommendations for.
  @_s.JsonKey(name: 'EC2Specification')
  final EC2Specification eC2Specification;

  ServiceSpecification({
    this.eC2Specification,
  });
  factory ServiceSpecification.fromJson(Map<String, dynamic> json) =>
      _$ServiceSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceSpecificationToJson(this);
}

enum SupportedSavingsPlansType {
  @_s.JsonValue('COMPUTE_SP')
  computeSp,
  @_s.JsonValue('EC2_INSTANCE_SP')
  ec2InstanceSp,
}

extension on SupportedSavingsPlansType {
  String toValue() {
    switch (this) {
      case SupportedSavingsPlansType.computeSp:
        return 'COMPUTE_SP';
      case SupportedSavingsPlansType.ec2InstanceSp:
        return 'EC2_INSTANCE_SP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The values that are available for a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TagValues {
  /// The key for the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The match options that you can use to filter your results.
  /// <code>MatchOptions</code> is only applicable for only applicable for actions
  /// related to Cost Category. The default values for <code>MatchOptions</code>
  /// is <code>EQUALS</code> and <code>CASE_SENSITIVE</code>.
  @_s.JsonKey(name: 'MatchOptions')
  final List<String> matchOptions;

  /// The specific value of the tag.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  TagValues({
    this.key,
    this.matchOptions,
    this.values,
  });
  factory TagValues.fromJson(Map<String, dynamic> json) =>
      _$TagValuesFromJson(json);

  Map<String, dynamic> toJson() => _$TagValuesToJson(this);
}

/// Details on recommended instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TargetInstance {
  /// The currency code that Amazon Web Services used to calculate the costs for
  /// this instance.
  @_s.JsonKey(name: 'CurrencyCode')
  final String currencyCode;

  /// Indicates whether or not this recommendation is the defaulted Amazon Web
  /// Services recommendation.
  @_s.JsonKey(name: 'DefaultTargetInstance')
  final bool defaultTargetInstance;

  /// Expected cost to operate this instance type on a monthly basis.
  @_s.JsonKey(name: 'EstimatedMonthlyCost')
  final String estimatedMonthlyCost;

  /// Estimated savings resulting from modification, on a monthly basis.
  @_s.JsonKey(name: 'EstimatedMonthlySavings')
  final String estimatedMonthlySavings;

  /// Expected utilization metrics for target instance type.
  @_s.JsonKey(name: 'ExpectedResourceUtilization')
  final ResourceUtilization expectedResourceUtilization;

  /// Details on the target instance type.
  @_s.JsonKey(name: 'ResourceDetails')
  final ResourceDetails resourceDetails;

  TargetInstance({
    this.currencyCode,
    this.defaultTargetInstance,
    this.estimatedMonthlyCost,
    this.estimatedMonthlySavings,
    this.expectedResourceUtilization,
    this.resourceDetails,
  });
  factory TargetInstance.fromJson(Map<String, dynamic> json) =>
      _$TargetInstanceFromJson(json);
}

enum TermInYears {
  @_s.JsonValue('ONE_YEAR')
  oneYear,
  @_s.JsonValue('THREE_YEARS')
  threeYears,
}

extension on TermInYears {
  String toValue() {
    switch (this) {
      case TermInYears.oneYear:
        return 'ONE_YEAR';
      case TermInYears.threeYears:
        return 'THREE_YEARS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details on termination recommendation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TerminateRecommendationDetail {
  /// The currency code that Amazon Web Services used to calculate the costs for
  /// this instance.
  @_s.JsonKey(name: 'CurrencyCode')
  final String currencyCode;

  /// Estimated savings resulting from modification, on a monthly basis.
  @_s.JsonKey(name: 'EstimatedMonthlySavings')
  final String estimatedMonthlySavings;

  TerminateRecommendationDetail({
    this.currencyCode,
    this.estimatedMonthlySavings,
  });
  factory TerminateRecommendationDetail.fromJson(Map<String, dynamic> json) =>
      _$TerminateRecommendationDetailFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCostCategoryDefinitionResponse {
  /// The unique identifier for your Cost Category.
  @_s.JsonKey(name: 'CostCategoryArn')
  final String costCategoryArn;

  /// The Cost Category's effective start date.
  @_s.JsonKey(name: 'EffectiveStart')
  final String effectiveStart;

  UpdateCostCategoryDefinitionResponse({
    this.costCategoryArn,
    this.effectiveStart,
  });
  factory UpdateCostCategoryDefinitionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCostCategoryDefinitionResponseFromJson(json);
}

/// The amount of utilization, in hours.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UtilizationByTime {
  /// The groups that this utilization result uses.
  @_s.JsonKey(name: 'Groups')
  final List<ReservationUtilizationGroup> groups;

  /// The period of time that this utilization was used for.
  @_s.JsonKey(name: 'TimePeriod')
  final DateInterval timePeriod;

  /// The total number of reservation hours that were used.
  @_s.JsonKey(name: 'Total')
  final ReservationAggregates total;

  UtilizationByTime({
    this.groups,
    this.timePeriod,
    this.total,
  });
  factory UtilizationByTime.fromJson(Map<String, dynamic> json) =>
      _$UtilizationByTimeFromJson(json);
}

class BillExpirationException extends _s.GenericAwsException {
  BillExpirationException({String type, String message})
      : super(type: type, code: 'BillExpirationException', message: message);
}

class DataUnavailableException extends _s.GenericAwsException {
  DataUnavailableException({String type, String message})
      : super(type: type, code: 'DataUnavailableException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class RequestChangedException extends _s.GenericAwsException {
  RequestChangedException({String type, String message})
      : super(type: type, code: 'RequestChangedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class UnresolvableUsageUnitException extends _s.GenericAwsException {
  UnresolvableUsageUnitException({String type, String message})
      : super(
            type: type,
            code: 'UnresolvableUsageUnitException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BillExpirationException': (type, message) =>
      BillExpirationException(type: type, message: message),
  'DataUnavailableException': (type, message) =>
      DataUnavailableException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'RequestChangedException': (type, message) =>
      RequestChangedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'UnresolvableUsageUnitException': (type, message) =>
      UnresolvableUsageUnitException(type: type, message: message),
};
