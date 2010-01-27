/* Copyright (C) 2010 Wildfire Games.
 * This file is part of 0 A.D.
 *
 * 0 A.D. is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * 0 A.D. is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with 0 A.D.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef INCLUDED_PARAMNODE
#define INCLUDED_PARAMNODE

#include "maths/Fixed.h"
#include "ps/Errors.h"

#include <map>
#include <set>

class XMBFile;
class XMBElement;

class CParamNode
{
public:
	typedef std::map<std::string, CParamNode> ChildrenMap;

	/**
	 * Loads the XML data specified by @a file into the node @a ret.
	 * Any existing data in @a ret will be overwritten or else kept, so this
	 * can be called multiple times to build up a node from multiple inputs.
	 */
	static void LoadXML(CParamNode& ret, const XMBFile& file);

	/**
	 * See LoadXML, but parses the XML string @a xml.
	 * @return error code if parsing failed, else @c PSRETURN_OK
	 */
	static PSRETURN LoadXMLString(CParamNode& ret, const char* xml);

	/**
	 * Finds the childs named @a name from @a src and from @a this, and copies the source child's children
	 * which are in the @a permitted set into this node's child.
	 * Intended for use as a filtered clone of XML files.
	 * @a this and @a src must have childs named @a name.
	 */
	void CopyFilteredChildrenOfChild(const CParamNode& src, const char* name, const std::set<std::string>& permitted);

	/**
	 * Returns the (unique) child node with the given name, or NULL if there is none.
	 */
	const CParamNode* GetChild(const char* name) const;
	// (Children are returned as const in order to allow future optimisations, where we assume
	// a node is always modified explicitly and not indirectly via its children, e.g. to cache jsvals)

	/**
	 * Returns the content of this node as a string
	 */
	const std::wstring& ToString() const;

	/**
	 * Parses the content of this node as an integer
	 */
	int ToInt() const;

	/**
	 * Parses the content of this node as a fixed-point number
	 */
	CFixed_23_8 ToFixed() const;

	/**
	 * Parses the content of this node as a boolean ("true" == true, anything else == false)
	 */
	bool ToBool() const;

	/**
	 * Returns the content of this node and its children as an XML string
	 */
	std::wstring ToXML() const;

	/**
	 * Write the content of this node and its children as an XML string, to the stream
	 */
	void ToXML(std::wostream& strm) const;

	/**
	 * Returns the names/nodes of the children of this node, ordered by name
	 */
	const ChildrenMap& GetChildren() const;

	/**
	 * Escapes a string so that it is well-formed XML content/attribute text.
	 * (Replaces "&" with "&amp;" etc, and replaces invalid characters with U+FFFD.)
	 */
	static std::wstring EscapeXMLString(const std::wstring& str);

private:
	void ApplyLayer(const XMBFile& xmb, const XMBElement& element);

	std::wstring m_Value;
	ChildrenMap m_Childs;
};

#endif // INCLUDED_PARAMNODE
