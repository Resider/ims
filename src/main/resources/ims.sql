/*
 Navicat Premium Data Transfer

 Source Server         : Resider
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ims

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 22/06/2021 05:20:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ims_goods
-- ----------------------------
DROP TABLE IF EXISTS `ims_goods`;
CREATE TABLE `ims_goods`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `goods_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货物名',
  `goods_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货物分类',
  `goods_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货物描述',
  `goods_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货物单位',
  `goods_quantity` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '货物库存',
  `goods_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '货物单价',
  `goods_spec` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货物规格型号',
  `fk_create_user` bigint(64) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `fk_update_user` bigint(64) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` int(2) NOT NULL COMMENT '是否删除 0未删除 1已删除',
  `status` int(2) NOT NULL COMMENT '状态 0禁用 1启用'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ims-货物表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_goods
-- ----------------------------
INSERT INTO `ims_goods` VALUES (487064341733588992, 'Sony xperia 1 mark ii', 'mobile phone', 'nice product', '台', 401.00, 7999.00, 'spec', NULL, '2021-06-21 17:42:18', NULL, NULL, 0, 1);
INSERT INTO `ims_goods` VALUES (487064697960022016, 'test goods 1·', 'mobile phone·', 'test·', 'test·', 100.01, 100.01, 'spec·', NULL, '2021-06-21 17:43:43', NULL, '2021-06-22 03:06:58', 0, 1);
INSERT INTO `ims_goods` VALUES (487064697960022017, 'test goods 2', 'mobile phone', 'test', 'test', 100.00, 100.00, 'spec', NULL, '2021-06-21 17:43:43', NULL, NULL, 0, 1);
INSERT INTO `ims_goods` VALUES (487064697960022018, 'test goods 3', 'computer', 'test', 'test', 100.00, 100.00, 'spec', NULL, '2021-06-21 17:43:43', NULL, NULL, 0, 1);
INSERT INTO `ims_goods` VALUES (487064697960022019, 'test goods 4', 'computer', 'test', 'test', 100.00, 100.00, 'spec', NULL, '2021-06-21 17:43:43', NULL, NULL, 0, 1);
INSERT INTO `ims_goods` VALUES (487064697960022020, 'test goods 5', 'computer', 'test', 'test', 100.00, 100.00, 'spec', NULL, '2021-06-21 17:43:43', NULL, NULL, 0, 1);
INSERT INTO `ims_goods` VALUES (487064697960022021, 'test goods 6', 'car', 'test', 'test', 100.00, 100.00, 'spec', NULL, '2021-06-21 17:43:43', NULL, NULL, 0, 1);
INSERT INTO `ims_goods` VALUES (487064697960022022, 'test goods 7', 'car', 'test', 'test', 100.00, 100.00, 'spec', NULL, '2021-06-21 17:43:43', NULL, NULL, 0, 1);
INSERT INTO `ims_goods` VALUES (487064697960022023, 'test goods 8', 'car', 'test', 'test', 100.00, 100.00, 'spec', NULL, '2021-06-21 17:43:43', NULL, NULL, 0, 1);
INSERT INTO `ims_goods` VALUES (487064697960022024, 'test goods 9', 'tool', 'test', 'test', 100.00, 100.00, 'spec', NULL, '2021-06-21 17:43:43', NULL, NULL, 0, 1);
INSERT INTO `ims_goods` VALUES (487064697960022025, 'test goods 10', 'tool', 'test', 'test', 100.00, 100.00, 'spec', NULL, '2021-06-21 17:43:43', NULL, NULL, 0, 1);

-- ----------------------------
-- Table structure for ims_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_record`;
CREATE TABLE `ims_record`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `fk_goods` bigint(64) NOT NULL COMMENT '外键-货物ID',
  `fk_warehouse` bigint(64) NOT NULL COMMENT '外键-仓库ID',
  `fk_operator` bigint(64) NOT NULL COMMENT '外键-操作用户ID',
  `fk_supplier` bigint(64) NOT NULL COMMENT '外键-供应商ID',
  `type` int(2) NOT NULL COMMENT '类型-1入库 2出库',
  `quantity` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '数量',
  `fk_create_user` bigint(64) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `fk_update_user` bigint(64) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` int(2) NOT NULL COMMENT '是否删除 0未删除 1已删除',
  `status` int(2) NOT NULL COMMENT '状态 0禁用 1启用'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_record
-- ----------------------------
INSERT INTO `ims_record` VALUES (487072079880536064, 487064341733588992, 485920656715300864, 1, 476908628705165312, 1, 100.00, 1, '2021-06-21 18:13:03', NULL, NULL, 0, 1);
INSERT INTO `ims_record` VALUES (487168147486031872, 487064341733588992, 485928622365491200, 1, 476908761303891968, 1, 200.00, 1, '2021-06-22 00:34:48', NULL, NULL, 0, 1);
INSERT INTO `ims_record` VALUES (487168531671695360, 487064341733588992, 485928491536760832, 1, 476908761303891968, 1, 1.00, 1, '2021-06-22 00:36:18', NULL, NULL, 0, 1);
INSERT INTO `ims_record` VALUES (487168680099725312, 487064341733588992, 485928491536760832, 1, 476909028971790336, 1, 100.00, 1, '2021-06-22 00:36:54', NULL, NULL, 0, 1);
INSERT INTO `ims_record` VALUES (487169058237202432, 487064341733588992, 485928622365491200, 1, 476908831017418752, 2, 200.00, 1, '2021-06-22 00:38:25', NULL, NULL, 0, 1);

-- ----------------------------
-- Table structure for ims_supplier
-- ----------------------------
DROP TABLE IF EXISTS `ims_supplier`;
CREATE TABLE `ims_supplier`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `supplier_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商姓名',
  `fk_create_user` bigint(64) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `fk_update_user` bigint(64) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` int(2) NOT NULL COMMENT '是否删除 0未删除 1已删除',
  `status` int(2) NOT NULL COMMENT '状态 0禁用 1启用'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ims-供应商表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_supplier
-- ----------------------------
INSERT INTO `ims_supplier` VALUES (476908628705165312, '供应商A`', NULL, '2021-05-24 17:07:08', NULL, '2021-06-22 03:33:46', 0, 1);
INSERT INTO `ims_supplier` VALUES (476908761303891968, '供应商B', NULL, '2021-05-24 17:07:39', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476908796544434176, '供应商C', NULL, '2021-05-24 17:07:48', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476908831017418752, '供应商C', NULL, '2021-05-24 17:07:56', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476908849044537344, '供应商D', NULL, '2021-05-24 17:08:00', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476908876622086144, '供应商E', NULL, '2021-05-24 17:08:07', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476908929503870976, '供应商F', NULL, '2021-05-24 17:08:19', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476908956452274176, '供应商G', NULL, '2021-05-24 17:08:26', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476908971140726784, '供应商H', NULL, '2021-05-24 17:08:29', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476908987272019968, '供应商I', NULL, '2021-05-24 17:08:33', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909000979005440, '供应商J', NULL, '2021-05-24 17:08:36', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909016888000512, '供应商K', NULL, '2021-05-24 17:08:40', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909028971790336, '供应商L', NULL, '2021-05-24 17:08:43', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909041076551680, '供应商M', NULL, '2021-05-24 17:08:46', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909053072261120, '供应商N', NULL, '2021-05-24 17:08:49', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909067383226368, '供应商O', NULL, '2021-05-24 17:08:52', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909080704335872, '供应商P', NULL, '2021-05-24 17:08:55', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909093480185856, '供应商Q', NULL, '2021-05-24 17:08:58', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909104507011072, '供应商R', NULL, '2021-05-24 17:09:01', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909114841776128, '供应商S', NULL, '2021-05-24 17:09:04', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909148522037248, '供应商T', NULL, '2021-05-24 17:09:12', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909163952881664, '供应商U', NULL, '2021-05-24 17:09:15', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909176972001280, '供应商V', NULL, '2021-05-24 17:09:18', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909189315837952, '供应商W', NULL, '2021-05-24 17:09:21', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909199143092224, '供应商X', NULL, '2021-05-24 17:09:24', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (476909213722492928, '供应商Y', NULL, '2021-05-24 17:09:27', NULL, NULL, 0, 1);
INSERT INTO `ims_supplier` VALUES (478683190434349056, '供应商Z', NULL, '2021-05-29 14:38:36', NULL, NULL, 0, 1);

-- ----------------------------
-- Table structure for ims_user
-- ----------------------------
DROP TABLE IF EXISTS `ims_user`;
CREATE TABLE `ims_user`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `type` int(4) NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `fk_create_user` bigint(64) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `fk_update_user` bigint(64) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` int(2) NOT NULL COMMENT '是否删除 0未删除 1已删除',
  `status` int(2) NOT NULL COMMENT '状态 0禁用 1启用'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ims-用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_user
-- ----------------------------
INSERT INTO `ims_user` VALUES (1, 'admin', '123456', 0, '17721476573', '18071455497@163.com', 1, '2021-05-29 10:06:09', 1, '2021-05-29 10:06:17', 0, 1);
INSERT INTO `ims_user` VALUES (487238552208949248, '2', '2', 0, '2', '2', NULL, '2021-06-22 05:14:33', NULL, NULL, 0, 1);
INSERT INTO `ims_user` VALUES (487238575734800384, '3', '3', 0, '3', '3', NULL, '2021-06-22 05:14:39', NULL, NULL, 0, 1);
INSERT INTO `ims_user` VALUES (487239042078490624, '4', '4', 0, '4', '4', NULL, '2021-06-22 05:16:30', NULL, NULL, 0, 1);
INSERT INTO `ims_user` VALUES (487239080628338688, '5', '5', 0, '5', '5', NULL, '2021-06-22 05:16:39', NULL, NULL, 0, 1);
INSERT INTO `ims_user` VALUES (487239231195463680, '111', '', 0, '2111', '2', NULL, '2021-06-22 05:17:15', NULL, NULL, 0, 1);
INSERT INTO `ims_user` VALUES (487239417422561280, '111121', '', 0, '2111', '2', NULL, '2021-06-22 05:18:00', NULL, NULL, 0, 1);

-- ----------------------------
-- Table structure for ims_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `ims_warehouse`;
CREATE TABLE `ims_warehouse`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `warehouse_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库名',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仓库地址',
  `fk_create_user` bigint(64) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `fk_update_user` bigint(64) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` int(2) NOT NULL COMMENT '是否删除 0未删除 1已删除',
  `status` int(2) NOT NULL COMMENT '状态 0禁用 1启用'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ims-仓库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_warehouse
-- ----------------------------
INSERT INTO `ims_warehouse` VALUES (485920656715300864, '测试仓库001`', '福建省厦门市集美区集美大道2508`', NULL, '2021-06-18 13:57:43', NULL, '2021-06-22 04:12:09', 0, 1);
INSERT INTO `ims_warehouse` VALUES (485928491536760832, '测试仓库002', '福建省厦门市湖里区尚忠社', NULL, '2021-06-18 14:28:50', NULL, NULL, 0, 1);
INSERT INTO `ims_warehouse` VALUES (485928622365491200, '测试仓库003', '福建省厦门市湖里区围里社', NULL, '2021-06-18 14:29:22', NULL, NULL, 0, 1);
INSERT INTO `ims_warehouse` VALUES (485928703407833088, '测试仓库004', '福建省厦门市思明区', NULL, '2021-06-18 14:29:41', NULL, NULL, 0, 1);

SET FOREIGN_KEY_CHECKS = 1;
