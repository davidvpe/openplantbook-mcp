# OpenPlantbook MCP Server - Test Plans

This directory contains test plans and prompts for validating the OpenPlantbook MCP server functionality.

## Available Test Plans

### [QUICK_TEST.md](./QUICK_TEST.md)
**5-minute smoke test** - Quick validation that the MCP server is working correctly.

Use this for:
- Initial setup verification
- Quick health checks
- Pre-deployment validation
- Regression testing after changes

Contains 5 essential tests covering all 4 MCP tools plus error handling.

---

### [FUNCTIONAL_TESTING.md](./FUNCTIONAL_TESTING.md)
**Comprehensive functional test suite** - 20 detailed test cases covering all functionality.

Use this for:
- Complete validation before releases
- Integration testing
- Quality assurance
- Identifying edge cases and bugs

Covers:
- All 4 MCP tools (search_plants, get_plant_care, get_care_summary, compare_conditions)
- Error handling and validation
- Edge cases and boundary conditions
- Real-world workflows
- Performance and caching

---

## How to Use These Test Plans

### For Quick Testing
1. Open a fresh Claude Code session
2. Ensure the MCP server is connected
3. Copy prompts from [QUICK_TEST.md](./QUICK_TEST.md)
4. Paste each prompt and verify expected results
5. Total time: ~5 minutes

### For Comprehensive Testing
1. Open a fresh Claude Code session
2. Ensure the MCP server is connected
3. Work through tests sequentially in [FUNCTIONAL_TESTING.md](./FUNCTIONAL_TESTING.md)
4. Document any failures or unexpected behavior
5. Check the summary checklist at the end
6. Total time: ~30-45 minutes

### For CI/CD Integration
The test prompts can be adapted for automated testing:
- Use MCP client libraries to send requests
- Parse responses and validate against expected results
- Report test failures with detailed logs

## Test Environment Setup

Before running any tests, ensure:

1. **MCP Server Built:**
   ```bash
   make build
   ```

2. **Configuration Ready:**
   - `.mcp.json` exists in project root
   - Contains valid OpenPlantbook API key
   - Points to correct binary path

3. **MCP Server Connected:**
   - Restart Claude Code if needed
   - Verify connection in new session
   - Check available tools are listed

4. **API Credentials Valid:**
   - Test API key works: `curl -H "Authorization: Token $OPENPLANTBOOK_API_KEY" https://open.plantbook.io/api/v1/plant/search?alias=monstera`
   - Check rate limits haven't been exceeded
   - Verify network connectivity

## Test Data

The test plans use real plant data from OpenPlantbook:
- **Monstera deliciosa** - Popular houseplant, well-documented
- **Basil (sweet)** - Common herb, good for testing
- **Tomato** - Multiple varieties, tests search results
- **Pothos** - Beginner-friendly, real-world scenario
- **Snake plant** - Tests sequential workflows

These plants are chosen because they:
- Have stable, reliable data in OpenPlantbook
- Represent common use cases
- Cover various plant categories
- Are unlikely to be removed from the database

## Expected Test Results

### Success Indicators
- ✅ All tools execute without errors
- ✅ Returned data matches expected formats
- ✅ Error handling is graceful and informative
- ✅ Performance is reasonable (<5 seconds per request)
- ✅ Data accuracy matches OpenPlantbook web interface

### Common Issues and Solutions

**Issue:** MCP server not found
- **Solution:** Check `.mcp.json` path, rebuild binary, restart Claude Code

**Issue:** Authentication errors
- **Solution:** Verify API key in `.env` and `.mcp.json`, check key is valid

**Issue:** Rate limit errors
- **Solution:** Wait 24 hours or use different API key, reduce test frequency

**Issue:** Plant not found errors
- **Solution:** Verify plant ID spelling, check plant exists in OpenPlantbook database

**Issue:** Timeout errors
- **Solution:** Check network connection, verify OpenPlantbook API is accessible

## Reporting Test Results

When reporting test results, include:

1. **Environment Information:**
   - OS and version
   - Go version
   - MCP server version
   - Claude Code version

2. **Test Execution Details:**
   - Which test plan was run
   - Total tests run / passed / failed
   - Execution time

3. **Failure Details (if any):**
   - Specific test that failed
   - Exact prompt used
   - Expected vs actual result
   - Error messages or logs
   - Steps to reproduce

4. **Additional Context:**
   - Recent changes to codebase
   - Network conditions
   - API rate limit status

## Contributing Test Cases

When adding new test cases:

1. Use clear, actionable prompts
2. Define expected results precisely
3. Include pass/fail criteria
4. Cover edge cases and error conditions
5. Test real-world scenarios
6. Keep prompts simple and focused

## Test Maintenance

These test plans should be updated when:
- New MCP tools are added
- Tool parameters change
- OpenPlantbook API changes
- New edge cases are discovered
- User feedback identifies gaps

## References

- [OpenPlantbook API Documentation](https://open.plantbook.io/docs)
- [MCP Specification](https://spec.modelcontextprotocol.io/)
- [OpenPlantbook Go SDK](https://github.com/rmrfslashbin/openplantbook-go)
- [Project README](../../README.md)
