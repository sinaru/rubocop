# frozen_string_literal: true

require 'rainbow'

require 'English'
require 'set'
require 'forwardable'
require 'regexp_parser'
require 'unicode/display_width/no_string_ext'
require 'rubocop-ast'
require_relative 'rubocop/ast_aliases'

require_relative 'rubocop/version'

require_relative 'rubocop/core_ext/string'
require_relative 'rubocop/ext/processed_source'

require_relative 'rubocop/path_util'
require_relative 'rubocop/file_finder'
require_relative 'rubocop/platform'
require_relative 'rubocop/name_similarity'
require_relative 'rubocop/string_interpreter'
require_relative 'rubocop/error'
require_relative 'rubocop/warning'

require_relative 'rubocop/cop/tokens_util'
require_relative 'rubocop/cop/util'
require_relative 'rubocop/cop/offense'
require_relative 'rubocop/cop/message_annotator'
require_relative 'rubocop/cop/ignored_node'
require_relative 'rubocop/cop/autocorrect_logic'
require_relative 'rubocop/cop/badge'
require_relative 'rubocop/cop/registry'
require_relative 'rubocop/cop/base'
require_relative 'rubocop/cop/cop'
require_relative 'rubocop/cop/commissioner'
require_relative 'rubocop/cop/documentation'
require_relative 'rubocop/cop/corrector'
require_relative 'rubocop/cop/force'
require_relative 'rubocop/cop/severity'
require_relative 'rubocop/cop/generator'
require_relative 'rubocop/cop/generator/configuration_injector'
require_relative 'rubocop/cop/generator/require_file_injector'

require_relative 'rubocop/cop/variable_force'
require_relative 'rubocop/cop/variable_force/branch'
require_relative 'rubocop/cop/variable_force/branchable'
require_relative 'rubocop/cop/variable_force/variable'
require_relative 'rubocop/cop/variable_force/assignment'
require_relative 'rubocop/cop/variable_force/reference'
require_relative 'rubocop/cop/variable_force/scope'
require_relative 'rubocop/cop/variable_force/variable_table'

require_relative 'rubocop/cop/mixin/annotation_comment'
require_relative 'rubocop/cop/mixin/array_min_size'
require_relative 'rubocop/cop/mixin/array_syntax'
require_relative 'rubocop/cop/mixin/alignment'
require_relative 'rubocop/cop/mixin/allowed_methods'
require_relative 'rubocop/cop/mixin/auto_corrector'
require_relative 'rubocop/cop/mixin/check_assignment'
require_relative 'rubocop/cop/mixin/check_line_breakable'
require_relative 'rubocop/cop/mixin/configurable_max'
require_relative 'rubocop/cop/mixin/code_length' # relies on configurable_max
require_relative 'rubocop/cop/mixin/configurable_enforced_style'
require_relative 'rubocop/cop/mixin/configurable_formatting'
require_relative 'rubocop/cop/mixin/configurable_naming'
require_relative 'rubocop/cop/mixin/configurable_numbering'
require_relative 'rubocop/cop/mixin/def_node'
require_relative 'rubocop/cop/mixin/documentation_comment'
require_relative 'rubocop/cop/mixin/duplication'
require_relative 'rubocop/cop/mixin/range_help'
require_relative 'rubocop/cop/mixin/empty_lines_around_body' # relies on range
require_relative 'rubocop/cop/mixin/empty_parameter'
require_relative 'rubocop/cop/mixin/end_keyword_alignment'
require_relative 'rubocop/cop/mixin/enforce_superclass'
require_relative 'rubocop/cop/mixin/first_element_line_break'
require_relative 'rubocop/cop/mixin/frozen_string_literal'
require_relative 'rubocop/cop/mixin/hash_alignment_styles'
require_relative 'rubocop/cop/mixin/hash_transform_method'
require_relative 'rubocop/cop/mixin/ignored_pattern'
require_relative 'rubocop/cop/mixin/ignored_methods'
require_relative 'rubocop/cop/mixin/integer_node'
require_relative 'rubocop/cop/mixin/interpolation'
require_relative 'rubocop/cop/mixin/line_length_help'
require_relative 'rubocop/cop/mixin/match_range'
require_relative 'rubocop/cop/metrics/utils/repeated_csend_discount'
require_relative 'rubocop/cop/mixin/method_complexity'
require_relative 'rubocop/cop/mixin/method_preference'
require_relative 'rubocop/cop/mixin/min_body_length'
require_relative 'rubocop/cop/mixin/multiline_element_indentation'
require_relative 'rubocop/cop/mixin/multiline_element_line_breaks'
require_relative 'rubocop/cop/mixin/multiline_expression_indentation'
require_relative 'rubocop/cop/mixin/multiline_literal_brace_layout'
require_relative 'rubocop/cop/mixin/negative_conditional'
require_relative 'rubocop/cop/mixin/heredoc'
require_relative 'rubocop/cop/mixin/nil_methods'
require_relative 'rubocop/cop/mixin/on_normal_if_unless'
require_relative 'rubocop/cop/mixin/ordered_gem_node'
require_relative 'rubocop/cop/mixin/parentheses'
require_relative 'rubocop/cop/mixin/percent_array'
require_relative 'rubocop/cop/mixin/percent_literal'
require_relative 'rubocop/cop/mixin/preceding_following_alignment'
require_relative 'rubocop/cop/mixin/preferred_delimiters'
require_relative 'rubocop/cop/mixin/rational_literal'
require_relative 'rubocop/cop/mixin/regexp_literal_help'
require_relative 'rubocop/cop/mixin/rescue_node'
require_relative 'rubocop/cop/mixin/safe_assignment'
require_relative 'rubocop/cop/mixin/space_after_punctuation'
require_relative 'rubocop/cop/mixin/space_before_punctuation'
require_relative 'rubocop/cop/mixin/surrounding_space'
require_relative 'rubocop/cop/mixin/statement_modifier'
require_relative 'rubocop/cop/mixin/string_help'
require_relative 'rubocop/cop/mixin/string_literals_help'
require_relative 'rubocop/cop/mixin/target_ruby_version'
require_relative 'rubocop/cop/mixin/trailing_body'
require_relative 'rubocop/cop/mixin/trailing_comma'
require_relative 'rubocop/cop/mixin/uncommunicative_name'
require_relative 'rubocop/cop/mixin/unused_argument'
require_relative 'rubocop/cop/mixin/visibility_help'
require_relative 'rubocop/cop/mixin/comments_help' # relies on visibility_help

require_relative 'rubocop/cop/utils/format_string'

require_relative 'rubocop/cop/migration/department_name'

require_relative 'rubocop/cop/correctors/alignment_corrector'
require_relative 'rubocop/cop/correctors/condition_corrector'
require_relative 'rubocop/cop/correctors/each_to_for_corrector'
require_relative 'rubocop/cop/correctors/empty_line_corrector'
require_relative 'rubocop/cop/correctors/for_to_each_corrector'
require_relative 'rubocop/cop/correctors/lambda_literal_to_method_corrector'
require_relative 'rubocop/cop/correctors/line_break_corrector'
require_relative 'rubocop/cop/correctors/multiline_literal_brace_corrector'
require_relative 'rubocop/cop/correctors/ordered_gem_corrector'
require_relative 'rubocop/cop/correctors/parentheses_corrector'
require_relative 'rubocop/cop/correctors/percent_literal_corrector'
require_relative 'rubocop/cop/correctors/punctuation_corrector'
require_relative 'rubocop/cop/correctors/space_corrector'
require_relative 'rubocop/cop/correctors/string_literal_corrector'
require_relative 'rubocop/cop/correctors/unused_arg_corrector'

require_relative 'rubocop/cop/bundler/duplicated_gem'
require_relative 'rubocop/cop/bundler/gem_comment'
require_relative 'rubocop/cop/bundler/insecure_protocol_source'
require_relative 'rubocop/cop/bundler/ordered_gems'

require_relative 'rubocop/cop/gemspec/duplicated_assignment'
require_relative 'rubocop/cop/gemspec/ordered_dependencies'
require_relative 'rubocop/cop/gemspec/required_ruby_version'
require_relative 'rubocop/cop/gemspec/ruby_version_globals_usage'

require_relative 'rubocop/cop/layout/access_modifier_indentation'
require_relative 'rubocop/cop/layout/argument_alignment'
require_relative 'rubocop/cop/layout/array_alignment'
require_relative 'rubocop/cop/layout/assignment_indentation'
require_relative 'rubocop/cop/layout/block_alignment'
require_relative 'rubocop/cop/layout/block_end_newline'
require_relative 'rubocop/cop/layout/case_indentation'
require_relative 'rubocop/cop/layout/class_structure'
require_relative 'rubocop/cop/layout/closing_heredoc_indentation'
require_relative 'rubocop/cop/layout/closing_parenthesis_indentation'
require_relative 'rubocop/cop/layout/comment_indentation'
require_relative 'rubocop/cop/layout/condition_position'
require_relative 'rubocop/cop/layout/def_end_alignment'
require_relative 'rubocop/cop/layout/dot_position'
require_relative 'rubocop/cop/layout/else_alignment'
require_relative 'rubocop/cop/layout/empty_comment'
require_relative 'rubocop/cop/layout/empty_line_after_guard_clause'
require_relative 'rubocop/cop/layout/empty_line_after_magic_comment'
require_relative 'rubocop/cop/layout/empty_line_between_defs'
require_relative 'rubocop/cop/layout/empty_lines_around_access_modifier'
require_relative 'rubocop/cop/layout/empty_lines_around_arguments'
require_relative 'rubocop/cop/layout/empty_lines_around_attribute_accessor'
require_relative 'rubocop/cop/layout/empty_lines_around_begin_body'
require_relative 'rubocop/cop/layout/empty_lines_around_block_body'
require_relative 'rubocop/cop/layout/empty_lines_around_class_body'
require_relative 'rubocop/cop/layout/empty_lines_around_exception_handling_keywords'
require_relative 'rubocop/cop/layout/empty_lines_around_method_body'
require_relative 'rubocop/cop/layout/empty_lines_around_module_body'
require_relative 'rubocop/cop/layout/empty_lines'
require_relative 'rubocop/cop/layout/end_alignment'
require_relative 'rubocop/cop/layout/end_of_line'
require_relative 'rubocop/cop/layout/extra_spacing'
require_relative 'rubocop/cop/layout/first_argument_indentation'
require_relative 'rubocop/cop/layout/first_array_element_indentation'
require_relative 'rubocop/cop/layout/first_array_element_line_break'
require_relative 'rubocop/cop/layout/first_hash_element_indentation'
require_relative 'rubocop/cop/layout/first_hash_element_line_break'
require_relative 'rubocop/cop/layout/first_method_argument_line_break'
require_relative 'rubocop/cop/layout/first_method_parameter_line_break'
require_relative 'rubocop/cop/layout/first_parameter_indentation'
require_relative 'rubocop/cop/layout/hash_alignment'
require_relative 'rubocop/cop/layout/heredoc_argument_closing_parenthesis'
require_relative 'rubocop/cop/layout/heredoc_indentation'
require_relative 'rubocop/cop/layout/indentation_consistency'
require_relative 'rubocop/cop/layout/indentation_style'
require_relative 'rubocop/cop/layout/indentation_width'
require_relative 'rubocop/cop/layout/initial_indentation'
require_relative 'rubocop/cop/layout/leading_comment_space'
require_relative 'rubocop/cop/layout/leading_empty_lines'
require_relative 'rubocop/cop/layout/line_length'
require_relative 'rubocop/cop/layout/multiline_array_brace_layout'
require_relative 'rubocop/cop/layout/multiline_array_line_breaks'
require_relative 'rubocop/cop/layout/multiline_assignment_layout'
require_relative 'rubocop/cop/layout/multiline_block_layout'
require_relative 'rubocop/cop/layout/multiline_hash_brace_layout'
require_relative 'rubocop/cop/layout/multiline_hash_key_line_breaks'
require_relative 'rubocop/cop/layout/multiline_method_argument_line_breaks'
require_relative 'rubocop/cop/layout/multiline_method_call_brace_layout'
require_relative 'rubocop/cop/layout/multiline_method_call_indentation'
require_relative 'rubocop/cop/layout/multiline_method_definition_brace_layout'
require_relative 'rubocop/cop/layout/multiline_operation_indentation'
require_relative 'rubocop/cop/layout/parameter_alignment'
require_relative 'rubocop/cop/layout/rescue_ensure_alignment'
require_relative 'rubocop/cop/layout/space_after_colon'
require_relative 'rubocop/cop/layout/space_after_comma'
require_relative 'rubocop/cop/layout/space_after_method_name'
require_relative 'rubocop/cop/layout/space_after_not'
require_relative 'rubocop/cop/layout/space_after_semicolon'
require_relative 'rubocop/cop/layout/space_around_block_parameters'
require_relative 'rubocop/cop/layout/space_around_equals_in_parameter_default'
require_relative 'rubocop/cop/layout/space_around_keyword'
require_relative 'rubocop/cop/layout/space_around_method_call_operator'
require_relative 'rubocop/cop/layout/space_around_operators'
require_relative 'rubocop/cop/layout/space_before_block_braces'
require_relative 'rubocop/cop/layout/space_before_comma'
require_relative 'rubocop/cop/layout/space_before_comment'
require_relative 'rubocop/cop/layout/space_before_first_arg'
require_relative 'rubocop/cop/layout/space_before_semicolon'
require_relative 'rubocop/cop/layout/space_in_lambda_literal'
require_relative 'rubocop/cop/layout/space_inside_array_percent_literal'
require_relative 'rubocop/cop/layout/space_inside_array_literal_brackets'
require_relative 'rubocop/cop/layout/space_inside_block_braces'
require_relative 'rubocop/cop/layout/space_inside_hash_literal_braces'
require_relative 'rubocop/cop/layout/space_inside_parens'
require_relative 'rubocop/cop/layout/space_inside_percent_literal_delimiters'
require_relative 'rubocop/cop/layout/space_inside_range_literal'
require_relative 'rubocop/cop/layout/space_inside_reference_brackets'
require_relative 'rubocop/cop/layout/space_inside_string_interpolation'
require_relative 'rubocop/cop/layout/trailing_empty_lines'
require_relative 'rubocop/cop/layout/trailing_whitespace'

require_relative 'rubocop/cop/lint/ambiguous_block_association'
require_relative 'rubocop/cop/lint/ambiguous_operator'
require_relative 'rubocop/cop/lint/ambiguous_regexp_literal'
require_relative 'rubocop/cop/lint/assignment_in_condition'
require_relative 'rubocop/cop/lint/big_decimal_new'
require_relative 'rubocop/cop/lint/binary_operator_with_identical_operands'
require_relative 'rubocop/cop/lint/boolean_symbol'
require_relative 'rubocop/cop/lint/circular_argument_reference'
require_relative 'rubocop/cop/lint/constant_resolution'
require_relative 'rubocop/cop/lint/debugger'
require_relative 'rubocop/cop/lint/deprecated_class_methods'
require_relative 'rubocop/cop/lint/deprecated_open_ssl_constant'
require_relative 'rubocop/cop/lint/disjunctive_assignment_in_constructor'
require_relative 'rubocop/cop/lint/duplicate_case_condition'
require_relative 'rubocop/cop/lint/duplicate_elsif_condition'
require_relative 'rubocop/cop/lint/duplicate_hash_key'
require_relative 'rubocop/cop/lint/duplicate_methods'
require_relative 'rubocop/cop/lint/duplicate_require'
require_relative 'rubocop/cop/lint/duplicate_rescue_exception'
require_relative 'rubocop/cop/lint/each_with_object_argument'
require_relative 'rubocop/cop/lint/else_layout'
require_relative 'rubocop/cop/lint/empty_conditional_body'
require_relative 'rubocop/cop/lint/empty_ensure'
require_relative 'rubocop/cop/lint/empty_expression'
require_relative 'rubocop/cop/lint/empty_file'
require_relative 'rubocop/cop/lint/empty_interpolation'
require_relative 'rubocop/cop/lint/empty_when'
require_relative 'rubocop/cop/lint/ensure_return'
require_relative 'rubocop/cop/lint/erb_new_arguments'
require_relative 'rubocop/cop/lint/flip_flop'
require_relative 'rubocop/cop/lint/float_comparison'
require_relative 'rubocop/cop/lint/float_out_of_range'
require_relative 'rubocop/cop/lint/format_parameter_mismatch'
require_relative 'rubocop/cop/lint/heredoc_method_call_position'
require_relative 'rubocop/cop/lint/implicit_string_concatenation'
require_relative 'rubocop/cop/lint/inherit_exception'
require_relative 'rubocop/cop/lint/ineffective_access_modifier'
require_relative 'rubocop/cop/lint/interpolation_check'
require_relative 'rubocop/cop/lint/literal_as_condition'
require_relative 'rubocop/cop/lint/literal_in_interpolation'
require_relative 'rubocop/cop/lint/loop'
require_relative 'rubocop/cop/lint/missing_cop_enable_directive'
require_relative 'rubocop/cop/lint/missing_super'
require_relative 'rubocop/cop/lint/mixed_regexp_capture_types'
require_relative 'rubocop/cop/lint/multiple_comparison'
require_relative 'rubocop/cop/lint/nested_method_definition'
require_relative 'rubocop/cop/lint/nested_percent_literal'
require_relative 'rubocop/cop/lint/next_without_accumulator'
require_relative 'rubocop/cop/lint/non_deterministic_require_order'
require_relative 'rubocop/cop/lint/non_local_exit_from_iterator'
require_relative 'rubocop/cop/lint/number_conversion'
require_relative 'rubocop/cop/lint/ordered_magic_comments'
require_relative 'rubocop/cop/lint/out_of_range_regexp_ref'
require_relative 'rubocop/cop/lint/parentheses_as_grouped_expression'
require_relative 'rubocop/cop/lint/percent_string_array'
require_relative 'rubocop/cop/lint/percent_symbol_array'
require_relative 'rubocop/cop/lint/raise_exception'
require_relative 'rubocop/cop/lint/rand_one'
require_relative 'rubocop/cop/lint/redundant_cop_disable_directive'
require_relative 'rubocop/cop/lint/redundant_cop_enable_directive'
require_relative 'rubocop/cop/lint/redundant_require_statement'
require_relative 'rubocop/cop/lint/redundant_splat_expansion'
require_relative 'rubocop/cop/lint/redundant_string_coercion'
require_relative 'rubocop/cop/lint/redundant_with_index'
require_relative 'rubocop/cop/lint/redundant_with_object'
require_relative 'rubocop/cop/lint/regexp_as_condition'
require_relative 'rubocop/cop/lint/require_parentheses'
require_relative 'rubocop/cop/lint/rescue_exception'
require_relative 'rubocop/cop/lint/rescue_type'
require_relative 'rubocop/cop/lint/return_in_void_context'
require_relative 'rubocop/cop/lint/safe_navigation_consistency'
require_relative 'rubocop/cop/lint/safe_navigation_chain'
require_relative 'rubocop/cop/lint/safe_navigation_with_empty'
require_relative 'rubocop/cop/lint/script_permission'
require_relative 'rubocop/cop/lint/self_assignment'
require_relative 'rubocop/cop/lint/send_with_mixin_argument'
require_relative 'rubocop/cop/lint/shadowed_argument'
require_relative 'rubocop/cop/lint/shadowed_exception'
require_relative 'rubocop/cop/lint/shadowing_outer_local_variable'
require_relative 'rubocop/cop/lint/struct_new_override'
require_relative 'rubocop/cop/lint/suppressed_exception'
require_relative 'rubocop/cop/lint/syntax'
require_relative 'rubocop/cop/lint/to_json'
require_relative 'rubocop/cop/lint/top_level_return_with_argument'
require_relative 'rubocop/cop/lint/trailing_comma_in_attribute_declaration'
require_relative 'rubocop/cop/lint/underscore_prefixed_variable_name'
require_relative 'rubocop/cop/lint/unified_integer'
require_relative 'rubocop/cop/lint/unreachable_code'
require_relative 'rubocop/cop/lint/unreachable_loop'
require_relative 'rubocop/cop/lint/unused_block_argument'
require_relative 'rubocop/cop/lint/unused_method_argument'
require_relative 'rubocop/cop/lint/uri_escape_unescape'
require_relative 'rubocop/cop/lint/uri_regexp'
require_relative 'rubocop/cop/lint/useless_access_modifier'
require_relative 'rubocop/cop/lint/useless_assignment'
require_relative 'rubocop/cop/lint/useless_else_without_rescue'
require_relative 'rubocop/cop/lint/useless_method_definition'
require_relative 'rubocop/cop/lint/useless_setter_call'
require_relative 'rubocop/cop/lint/void'

require_relative 'rubocop/cop/metrics/utils/iterating_block'
require_relative 'rubocop/cop/metrics/cyclomatic_complexity'
# relies on cyclomatic_complexity
require_relative 'rubocop/cop/metrics/utils/abc_size_calculator'
require_relative 'rubocop/cop/metrics/utils/code_length_calculator'
require_relative 'rubocop/cop/metrics/abc_size'
require_relative 'rubocop/cop/metrics/block_length'
require_relative 'rubocop/cop/metrics/block_nesting'
require_relative 'rubocop/cop/metrics/class_length'
require_relative 'rubocop/cop/metrics/method_length'
require_relative 'rubocop/cop/metrics/module_length'
require_relative 'rubocop/cop/metrics/parameter_lists'
require_relative 'rubocop/cop/metrics/perceived_complexity'

require_relative 'rubocop/cop/naming/accessor_method_name'
require_relative 'rubocop/cop/naming/ascii_identifiers'
require_relative 'rubocop/cop/naming/block_parameter_name'
require_relative 'rubocop/cop/naming/class_and_module_camel_case'
require_relative 'rubocop/cop/naming/constant_name'
require_relative 'rubocop/cop/naming/file_name'
require_relative 'rubocop/cop/naming/heredoc_delimiter_case'
require_relative 'rubocop/cop/naming/heredoc_delimiter_naming'
require_relative 'rubocop/cop/naming/memoized_instance_variable_name'
require_relative 'rubocop/cop/naming/method_name'
require_relative 'rubocop/cop/naming/method_parameter_name'
require_relative 'rubocop/cop/naming/binary_operator_parameter_name'
require_relative 'rubocop/cop/naming/predicate_name'
require_relative 'rubocop/cop/naming/rescued_exceptions_variable_name'
require_relative 'rubocop/cop/naming/variable_name'
require_relative 'rubocop/cop/naming/variable_number'

require_relative 'rubocop/cop/style/access_modifier_declarations'
require_relative 'rubocop/cop/style/accessor_grouping'
require_relative 'rubocop/cop/style/alias'
require_relative 'rubocop/cop/style/and_or'
require_relative 'rubocop/cop/style/array_coercion'
require_relative 'rubocop/cop/style/array_join'
require_relative 'rubocop/cop/style/ascii_comments'
require_relative 'rubocop/cop/style/attr'
require_relative 'rubocop/cop/style/auto_resource_cleanup'
require_relative 'rubocop/cop/style/bare_percent_literals'
require_relative 'rubocop/cop/style/begin_block'
require_relative 'rubocop/cop/style/bisected_attr_accessor'
require_relative 'rubocop/cop/style/block_comments'
require_relative 'rubocop/cop/style/block_delimiters'
require_relative 'rubocop/cop/style/case_equality'
require_relative 'rubocop/cop/style/case_like_if'
require_relative 'rubocop/cop/style/character_literal'
require_relative 'rubocop/cop/style/class_and_module_children'
require_relative 'rubocop/cop/style/class_check'
require_relative 'rubocop/cop/style/class_methods'
require_relative 'rubocop/cop/style/class_methods_definitions'
require_relative 'rubocop/cop/style/class_vars'
require_relative 'rubocop/cop/style/collection_methods'
require_relative 'rubocop/cop/style/colon_method_call'
require_relative 'rubocop/cop/style/colon_method_definition'
require_relative 'rubocop/cop/style/combinable_loops'
require_relative 'rubocop/cop/style/command_literal'
require_relative 'rubocop/cop/style/comment_annotation'
require_relative 'rubocop/cop/style/commented_keyword'
require_relative 'rubocop/cop/style/conditional_assignment'
require_relative 'rubocop/cop/style/constant_visibility'
require_relative 'rubocop/cop/style/copyright'
require_relative 'rubocop/cop/style/date_time'
require_relative 'rubocop/cop/style/def_with_parentheses'
require_relative 'rubocop/cop/style/dir'
require_relative 'rubocop/cop/style/disable_cops_within_source_code_directive'
require_relative 'rubocop/cop/style/documentation_method'
require_relative 'rubocop/cop/style/documentation'
require_relative 'rubocop/cop/style/double_cop_disable_directive'
require_relative 'rubocop/cop/style/double_negation'
require_relative 'rubocop/cop/style/each_for_simple_loop'
require_relative 'rubocop/cop/style/each_with_object'
require_relative 'rubocop/cop/style/empty_block_parameter'
require_relative 'rubocop/cop/style/empty_case_condition'
require_relative 'rubocop/cop/style/empty_else'
require_relative 'rubocop/cop/style/empty_lambda_parameter'
require_relative 'rubocop/cop/style/empty_literal'
require_relative 'rubocop/cop/style/empty_method'
require_relative 'rubocop/cop/style/encoding'
require_relative 'rubocop/cop/style/end_block'
require_relative 'rubocop/cop/style/eval_with_location'
require_relative 'rubocop/cop/style/even_odd'
require_relative 'rubocop/cop/style/expand_path_arguments'
require_relative 'rubocop/cop/style/explicit_block_argument'
require_relative 'rubocop/cop/style/exponential_notation'
require_relative 'rubocop/cop/style/float_division'
require_relative 'rubocop/cop/style/for'
require_relative 'rubocop/cop/style/format_string'
require_relative 'rubocop/cop/style/format_string_token'
require_relative 'rubocop/cop/style/frozen_string_literal_comment'
require_relative 'rubocop/cop/style/global_std_stream'
require_relative 'rubocop/cop/style/global_vars'
require_relative 'rubocop/cop/style/guard_clause'
require_relative 'rubocop/cop/style/hash_as_last_array_item'
require_relative 'rubocop/cop/style/hash_each_methods'
require_relative 'rubocop/cop/style/hash_like_case'
require_relative 'rubocop/cop/style/hash_syntax'
require_relative 'rubocop/cop/style/hash_transform_keys'
require_relative 'rubocop/cop/style/hash_transform_values'
require_relative 'rubocop/cop/style/identical_conditional_branches'
require_relative 'rubocop/cop/style/if_inside_else'
require_relative 'rubocop/cop/style/if_unless_modifier'
require_relative 'rubocop/cop/style/if_unless_modifier_of_if_unless'
require_relative 'rubocop/cop/style/if_with_semicolon'
require_relative 'rubocop/cop/style/implicit_runtime_error'
require_relative 'rubocop/cop/style/infinite_loop'
require_relative 'rubocop/cop/style/inverse_methods'
require_relative 'rubocop/cop/style/inline_comment'
require_relative 'rubocop/cop/style/ip_addresses'
require_relative 'rubocop/cop/style/keyword_parameters_order'
require_relative 'rubocop/cop/style/lambda'
require_relative 'rubocop/cop/style/lambda_call'
require_relative 'rubocop/cop/style/line_end_concatenation'
require_relative 'rubocop/cop/style/method_call_without_args_parentheses'
require_relative 'rubocop/cop/style/method_call_with_args_parentheses'
require_relative 'rubocop/cop/style/redundant_assignment'
require_relative 'rubocop/cop/style/redundant_fetch_block'
require_relative 'rubocop/cop/style/redundant_file_extension_in_require'
require_relative 'rubocop/cop/style/redundant_self_assignment'
require_relative 'rubocop/cop/style/sole_nested_conditional'
require_relative 'rubocop/cop/style/method_call_with_args_parentheses/omit_parentheses'
require_relative 'rubocop/cop/style/method_call_with_args_parentheses/require_parentheses'
require_relative 'rubocop/cop/style/method_called_on_do_end_block'
require_relative 'rubocop/cop/style/method_def_parentheses'
require_relative 'rubocop/cop/style/min_max'
require_relative 'rubocop/cop/style/missing_else'
require_relative 'rubocop/cop/style/missing_respond_to_missing'
require_relative 'rubocop/cop/style/mixin_grouping'
require_relative 'rubocop/cop/style/mixin_usage'
require_relative 'rubocop/cop/style/module_function'
require_relative 'rubocop/cop/style/multiline_block_chain'
require_relative 'rubocop/cop/style/multiline_if_then'
require_relative 'rubocop/cop/style/multiline_if_modifier'
require_relative 'rubocop/cop/style/multiline_method_signature'
require_relative 'rubocop/cop/style/multiline_memoization'
require_relative 'rubocop/cop/style/multiline_ternary_operator'
require_relative 'rubocop/cop/style/multiline_when_then'
require_relative 'rubocop/cop/style/multiple_comparison'
require_relative 'rubocop/cop/style/mutable_constant'
require_relative 'rubocop/cop/style/negated_if'
require_relative 'rubocop/cop/style/negated_unless'
require_relative 'rubocop/cop/style/negated_while'
require_relative 'rubocop/cop/style/nested_modifier'
require_relative 'rubocop/cop/style/nested_parenthesized_calls'
require_relative 'rubocop/cop/style/nested_ternary_operator'
require_relative 'rubocop/cop/style/next'
require_relative 'rubocop/cop/style/nil_comparison'
require_relative 'rubocop/cop/style/non_nil_check'
require_relative 'rubocop/cop/style/not'
require_relative 'rubocop/cop/style/numeric_literals'
require_relative 'rubocop/cop/style/numeric_literal_prefix'
require_relative 'rubocop/cop/style/numeric_predicate'
require_relative 'rubocop/cop/style/one_line_conditional'
require_relative 'rubocop/cop/style/or_assignment'
require_relative 'rubocop/cop/style/option_hash'
require_relative 'rubocop/cop/style/optional_arguments'
require_relative 'rubocop/cop/style/optional_boolean_parameter'
require_relative 'rubocop/cop/style/parallel_assignment'
require_relative 'rubocop/cop/style/parentheses_around_condition'
require_relative 'rubocop/cop/style/percent_literal_delimiters'
require_relative 'rubocop/cop/style/percent_q_literals'
require_relative 'rubocop/cop/style/perl_backrefs'
require_relative 'rubocop/cop/style/preferred_hash_methods'
require_relative 'rubocop/cop/style/proc'
require_relative 'rubocop/cop/style/raise_args'
require_relative 'rubocop/cop/style/random_with_offset'
require_relative 'rubocop/cop/style/redundant_begin'
require_relative 'rubocop/cop/style/redundant_capital_w'
require_relative 'rubocop/cop/style/redundant_condition'
require_relative 'rubocop/cop/style/redundant_conditional'
require_relative 'rubocop/cop/style/redundant_exception'
require_relative 'rubocop/cop/style/redundant_freeze'
require_relative 'rubocop/cop/style/redundant_interpolation'
require_relative 'rubocop/cop/style/redundant_parentheses'
require_relative 'rubocop/cop/style/redundant_percent_q'
require_relative 'rubocop/cop/style/redundant_regexp_character_class'
require_relative 'rubocop/cop/style/redundant_regexp_escape'
require_relative 'rubocop/cop/style/redundant_return'
require_relative 'rubocop/cop/style/redundant_self'
require_relative 'rubocop/cop/style/redundant_sort'
require_relative 'rubocop/cop/style/redundant_sort_by'
require_relative 'rubocop/cop/style/regexp_literal'
require_relative 'rubocop/cop/style/rescue_modifier'
require_relative 'rubocop/cop/style/rescue_standard_error'
require_relative 'rubocop/cop/style/return_nil'
require_relative 'rubocop/cop/style/safe_navigation'
require_relative 'rubocop/cop/style/sample'
require_relative 'rubocop/cop/style/self_assignment'
require_relative 'rubocop/cop/style/semicolon'
require_relative 'rubocop/cop/style/send'
require_relative 'rubocop/cop/style/signal_exception'
require_relative 'rubocop/cop/style/single_argument_dig'
require_relative 'rubocop/cop/style/single_line_block_params'
require_relative 'rubocop/cop/style/single_line_methods'
require_relative 'rubocop/cop/style/slicing_with_range'
require_relative 'rubocop/cop/style/special_global_vars'
require_relative 'rubocop/cop/style/stabby_lambda_parentheses'
require_relative 'rubocop/cop/style/stderr_puts'
require_relative 'rubocop/cop/style/string_concatenation'
require_relative 'rubocop/cop/style/string_hash_keys'
require_relative 'rubocop/cop/style/string_literals'
require_relative 'rubocop/cop/style/string_literals_in_interpolation'
require_relative 'rubocop/cop/style/string_methods'
require_relative 'rubocop/cop/style/strip'
require_relative 'rubocop/cop/style/struct_inheritance'
require_relative 'rubocop/cop/style/symbol_array'
require_relative 'rubocop/cop/style/symbol_literal'
require_relative 'rubocop/cop/style/symbol_proc'
require_relative 'rubocop/cop/style/ternary_parentheses'
require_relative 'rubocop/cop/style/trailing_body_on_class'
require_relative 'rubocop/cop/style/trailing_body_on_method_definition'
require_relative 'rubocop/cop/style/trailing_body_on_module'
require_relative 'rubocop/cop/style/trailing_comma_in_arguments'
require_relative 'rubocop/cop/style/trailing_comma_in_array_literal'
require_relative 'rubocop/cop/style/trailing_comma_in_block_args'
require_relative 'rubocop/cop/style/trailing_comma_in_hash_literal'
require_relative 'rubocop/cop/style/trailing_method_end_statement'
require_relative 'rubocop/cop/style/trailing_underscore_variable'
require_relative 'rubocop/cop/style/trivial_accessors'
require_relative 'rubocop/cop/style/unless_else'
require_relative 'rubocop/cop/style/unpack_first'
require_relative 'rubocop/cop/style/variable_interpolation'
require_relative 'rubocop/cop/style/when_then'
require_relative 'rubocop/cop/style/while_until_do'
require_relative 'rubocop/cop/style/while_until_modifier'
require_relative 'rubocop/cop/style/word_array'
require_relative 'rubocop/cop/style/yoda_condition'
require_relative 'rubocop/cop/style/zero_length_predicate'

require_relative 'rubocop/cop/security/eval'
require_relative 'rubocop/cop/security/json_load'
require_relative 'rubocop/cop/security/marshal_load'
require_relative 'rubocop/cop/security/open'
require_relative 'rubocop/cop/security/yaml_load'

require_relative 'rubocop/cop/team'

require_relative 'rubocop/formatter/base_formatter'
require_relative 'rubocop/formatter/simple_text_formatter'
# relies on simple text
require_relative 'rubocop/formatter/clang_style_formatter'
require_relative 'rubocop/formatter/disabled_config_formatter'
require_relative 'rubocop/formatter/emacs_style_formatter'
require_relative 'rubocop/formatter/file_list_formatter'
require_relative 'rubocop/formatter/fuubar_style_formatter'
require_relative 'rubocop/formatter/html_formatter'
require_relative 'rubocop/formatter/json_formatter'
require_relative 'rubocop/formatter/junit_formatter'
require_relative 'rubocop/formatter/offense_count_formatter'
require_relative 'rubocop/formatter/progress_formatter'
require_relative 'rubocop/formatter/quiet_formatter'
require_relative 'rubocop/formatter/tap_formatter'
require_relative 'rubocop/formatter/worst_offenders_formatter'
require_relative 'rubocop/formatter/pacman_formatter'
# relies on progress formatter
require_relative 'rubocop/formatter/auto_gen_config_formatter'

require_relative 'rubocop/formatter/formatter_set'

require_relative 'rubocop/cached_data'
require_relative 'rubocop/config'
require_relative 'rubocop/config_loader_resolver'
require_relative 'rubocop/config_loader'
require_relative 'rubocop/config_obsoletion'
require_relative 'rubocop/config_store'
require_relative 'rubocop/config_validator'
require_relative 'rubocop/target_finder'
require_relative 'rubocop/comment_config'
require_relative 'rubocop/magic_comment'
require_relative 'rubocop/result_cache'
require_relative 'rubocop/runner'
require_relative 'rubocop/cli'
require_relative 'rubocop/cli/command'
require_relative 'rubocop/cli/environment'
require_relative 'rubocop/cli/command/base'
require_relative 'rubocop/cli/command/auto_genenerate_config'
require_relative 'rubocop/cli/command/execute_runner'
require_relative 'rubocop/cli/command/init_dotfile'
require_relative 'rubocop/cli/command/show_cops'
require_relative 'rubocop/cli/command/version'
require_relative 'rubocop/options'
require_relative 'rubocop/remote_config'
require_relative 'rubocop/target_ruby'
require_relative 'rubocop/yaml_duplication_checker'
