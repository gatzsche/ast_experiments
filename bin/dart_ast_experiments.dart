import 'dart:developer';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

String src = """
  Dynamism d = new Dynamism(expert:true);
main(){
  var o = new Object();
  d.on(o).hi = 'bye';
}
""";
main() {
  try {
    var ast = parseFile(
        path:
            '/Users/gatzsche/dev/sandbox/dart_ast_experiments/bin/sample.dart',
        featureSet: FeatureSet.latestLanguageVersion());
    final root = ast.unit.root;
    var v = new Visitor();
    ast.unit.visitChildren(v);

    debugger();
  } catch (error) {
    print(error);
  }

  /* var ast = parseCompilationUnit(src, parseFunctionBodies: true);
  print('initial value: ');
  print(ast.toSource());
  var v = new Visitor();
  ast.visitChildren(v);
  print('After modification:');
  print(ast.toSource());*/
}

class Visitor extends RecursiveAstVisitor {
  @override
  visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
    debugger();
    /*//filter
    var p = new RegExp(r'.*\.on\(\w\)');
    if (!p.hasMatch(node.toString())) return;

    //replace
    SimpleStringLiteral ssl = _create_SimpleStringLiteral(node);
    node.parent.accept(new NodeReplacer(node, ssl));*/
  }
}
